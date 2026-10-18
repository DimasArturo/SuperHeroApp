import 'package:flutter_test/flutter_test.dart';
import 'package:superhero_app/data/model/superhero_response.dart';

void main() {
  test('parses a response without results as an empty result list', () {
    final response = SuperheroResponse.fromJson({'response': 'error'});

    expect(response.response, 'error');
    expect(response.result, isEmpty);
  });

  test('parses null results as an empty result list', () {
    final response = SuperheroResponse.fromJson({
      'response': 'error',
      'results': null,
    });

    expect(response.result, isEmpty);
  });
}
