part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();
}

class Empy extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class Loading extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({@required this.trivia});
  @override
  List<Object> get props => [this.trivia];
}

class Error extends NumberTriviaState {
  final String message;

  Error(this.message);

  @override
  List<Object> get props => [this.message];
}