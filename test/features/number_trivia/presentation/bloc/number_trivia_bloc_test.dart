import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/core/error/failure.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/core/usecases/usecase.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/core/util/input_converter.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/presentation/bloc/bloc/number_trivia_bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
        concrete: mockGetConcreteNumberTrivia,
        random: mockGetRandomNumberTrivia,
        inputConverter: mockInputConverter);
  });

  test('should be return empty when is initState', () {
    expect(bloc.state, isA<Empy>());
  });

  group('GetTRiviaForConcreteNumber', () {
    final tNumberString = '1';
    final tNumberParsed = 1;
    final tNumberTrivia = NumberTrivia(text: 'testtrivia', number: 1);
    void setUpMockInputConverterSuccess() {
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Right(tNumberParsed));
    }

    test(
        'should call the InputConverte to validate and convert the string to and usigned integer',
        () async {
      //arrange
      setUpMockInputConverterSuccess();
      //act
      bloc.add(GetTriviaForConcreteNumber(tNumberString));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
      //assert
      verify(Right(mockInputConverter.stringToUnsignedInteger(tNumberString)));
    });
/*
    test(
      'should emit [Error] when the input is invalid',
      () async {
        // arrange
        when(mockInputConverter.stringToUnsignedInteger(any))
            .thenReturn(Left(InvalidInputFailure()));
        // assert later
        final expected = [
          // The initial state is always emitted first

          Error(INVALID_INPUT_FAILURE_MESSAGE),
        ];
        expectLater(
          bloc.asBroadcastStream(),
          emitsInOrder(expected),
        );
        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));
      },
    );

    test('should from the concrete use case', () async {
      //arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      //act
      bloc.add(GetTriviaForConcreteNumber(tNumberString));
      untilCalled(mockGetConcreteNumberTrivia(any));

      //assert
      verifyNever(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
    });

    test('should emit [Loading, Loaded] when data us getting data syccesfully',
        () async {
      //arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      //assert
      final expected = [Empy(), Loading(), Loaded(trivia: tNumberTrivia)];
      expectLater(bloc.state, emitsInOrder(expected));

      //act
      bloc.add(GetTriviaForConcreteNumber(tNumberString));
    });

    test('should emit [Loading, Error] when data us getting data fails',
        () async {
      //arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      //assert
      final expected = [Empy(), Loading(), Error(SERVER_FAILURE_MESSAGE)];
      expectLater(bloc.state, emitsInOrder(expected));

      //act
      bloc.add(GetTriviaForConcreteNumber(tNumberString));
    });

    test(
        'should emit [Loading, Error] with a proper message for the error when getting data fails',
        () async {
      //arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Left(CacheFailure()));
      //assert
      final expected = [Empy(), Loading(), Error(CACHE_FAILURE_MESSAGE)];
      expectLater(bloc.state, emitsInOrder(expected));

      //act
      bloc.add(GetTriviaForConcreteNumber(tNumberString));
    });

    */
  });

  group('GetTRiviaForRandomNumber', () {
    final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

    test('should from the random use case', () async {
      //arrange

      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      //act
      bloc.add(GetTriviaForRandomNumber());
      untilCalled(mockGetConcreteNumberTrivia(any));

      //assert
      verifyNever(mockGetRandomNumberTrivia(NoParams()));
    });

    /*
    test('should emit [Loading, Loaded] when data us getting data syccesfully',
        () async {
      //arrange

      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      //assert
      final expected = [Empy(), Loading(), Loaded(trivia: tNumberTrivia)];
      expectLater(bloc.state, emitsInOrder(expected));

      //act
      bloc.add(GetTriviaForRandomNumber());
    });

    test('should emit [Loading, Error] when data us getting data fails',
        () async {
      //arrange

      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      //assert
      final expected = [Empy(), Loading(), Error(SERVER_FAILURE_MESSAGE)];
      expectLater(bloc.state, emitsInOrder(expected));

      //act
      bloc.add(GetTriviaForRandomNumber());
    });

    test(
        'should emit [Loading, Error] with a proper message for the error when getting data fails',
        () async {
      //arrange

      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Left(CacheFailure()));
      //assert
      final expected = [Empy(), Loading(), Error(CACHE_FAILURE_MESSAGE)];
      expectLater(bloc.state, emitsInOrder(expected));

      //act
      bloc.add(GetTriviaForRandomNumber());
    });


    */
  });
}
