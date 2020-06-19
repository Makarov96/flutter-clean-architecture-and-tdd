import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/core/usecases/usecase.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';


class MockNumberTriviaRepository extends Mock 
implements NumberTriviaRepository{
}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp((){
  mockNumberTriviaRepository = MockNumberTriviaRepository();
  usecase =GetRandomNumberTrivia (mockNumberTriviaRepository);
  });

 final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('should get trivia fot the number from the repository', 
  ()async{
    //arrage
    when(mockNumberTriviaRepository.getRandomNumberTrivia()).thenAnswer((_) async => Right(tNumberTrivia));
    
    // act
   final result = await  usecase(NoParams());
    //assets
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}