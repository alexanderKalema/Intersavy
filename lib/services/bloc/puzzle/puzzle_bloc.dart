import 'dart:ui';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android_app_development/constants.dart';
import 'package:android_app_development/services/database_service.dart';

part 'puzzle_state.dart';

part 'puzzle_event.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  int? computerGuess;
  int trialCount = 0;
  List<PreviousGuesses> guess = [];
  late SharedPreferences prefs;
  late bool isIntroduced;

  PuzzleBloc() : super(PuzzleState()) {
    on<PuzzleFirstRun>(_onPuzzleFirstRun);
    on<PuzzleStartGame>(_onPuzzleStartGame);
    on<PuzzleTryAnother>(_onPuzzleTryAnother);
  }

  _onPuzzleFirstRun(PuzzleFirstRun event, emit) async {
    prefs = await SharedPreferences.getInstance();
    isIntroduced = prefs.getBool('isIntroduced') ?? false;
    if (!isIntroduced && !(event.rule?.contains("3") ?? false)) {
      emit(PuzzleInitial(
          rule: RULES[window.locale.toString()]![
              RULES[window.locale.toString()]!.indexOf(event.rule ?? '') + 1]));
    } else {
      await prefs.setBool('isIntroduced', true);
      _onPuzzleStartGame(event, emit);
    }
  }

  _onPuzzleStartGame(event, emit) {
    computerGuess = null;
    trialCount = 0;
    guess = [];
    emit(PuzzleNewGame());
  }

  _onPuzzleTryAnother(event, emit) async {
    int currentMagnitude = 0;
    int currentOrder = 0;
    if (computerGuess == null) {
      List<int> digits = [];
      while (digits.length < 4) {
        int digit = Random().nextInt(9) + 1;
        if (!digits.contains(digit)) {
          digits.add(digit);
        }
      }

      computerGuess = int.parse(digits.join(''));
    }

    final common = event.currentGuess
        .toString()
        .split('')
        .where(
            (element) => computerGuess.toString().split('').contains(element))
        .toSet()
        .toList();

    currentMagnitude = common.length;
    common.forEach((element) {
      final index1 = event.currentGuess.toString().split('').indexOf(element);
      final index2 = computerGuess.toString().split('').indexOf(element);
      if (index1 == index2) {
        currentOrder++;
      }
    });

    if (currentMagnitude == 4 && currentOrder == 4) {
      DatabaseService mydb = DatabaseService();
      await mydb.createScore(score: trialCount.toString());
      emit(PuzzleFinished(
          trialCount: trialCount.toString(),
          computerGuess: computerGuess.toString()));
    } else {
      guess.add(PreviousGuesses(
          guess: event.currentGuess,
          magnitude: currentMagnitude,
          order: currentOrder));
      trialCount++;
      emit(PuzzleCurrentAnswer(
          guesses: guess, magnitude: currentMagnitude, order: currentOrder));
    }
  }
}

class PreviousGuesses {
  int guess;
  int magnitude;
  int order;

  PreviousGuesses(
      {required this.guess, required this.magnitude, required this.order});
}
