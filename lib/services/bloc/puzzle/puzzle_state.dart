part of 'puzzle_bloc.dart';
 class PuzzleState{
}

class PuzzleInitial extends PuzzleState{
   String rule;
   PuzzleInitial({required this.rule});

}

class PuzzleNewGame extends PuzzleState{
}

class PuzzleCurrentAnswer extends PuzzleState{
   List<PreviousGuesses> guesses;
  int magnitude;
  int order;

  PuzzleCurrentAnswer({ required this.guesses, required this.magnitude, required this.order});
}

class PuzzleFinished extends PuzzleState{
   final String trialCount;
   final String computerGuess;
   PuzzleFinished({required this.computerGuess, required this.trialCount});
}