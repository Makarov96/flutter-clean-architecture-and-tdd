import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/core/error/failure.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}