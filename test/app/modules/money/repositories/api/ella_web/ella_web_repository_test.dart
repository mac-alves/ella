import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:ella/app/modules/money/repositories/api/ella_web/ella_web_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  EllaWebRepository repository;
  // MockClient client;

  setUp(() {
    // repository = EllaWebRepository();
    // client = MockClient();
  });

  group('EllaWebRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<EllaWebRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
