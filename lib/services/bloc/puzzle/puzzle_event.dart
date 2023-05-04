part of "puzzle_bloc.dart";


abstract class PuzzleEvent{
}

class PuzzleFirstRun extends PuzzleEvent{
  String? rule;

  PuzzleFirstRun({this.rule});
}

class PuzzleWon extends PuzzleEvent{
  final int score;
  PuzzleWon({required this.score});
}

class PuzzleStartGame extends PuzzleEvent{

}

class PuzzleTryAnother extends PuzzleEvent{

  int currentGuess;
  PuzzleTryAnother({required this.currentGuess});
}
