import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;


  setUp((){
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);

  });


  group('getConcreteNumberTrivia', (){
    final tNumber = 1;

    test('''should preform a GET request on a URL with number 
            being the endpoint and wiht application/json header''',
    () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_)  async => http.Response(fixture('trivia.json'),200));
      //act
      dataSource.getConcreteNumberTrivia(tNumber);
      //assert
      verify(mockHttpClient.get('http://numbers.com/$tNumber'));
    });
  });
}
