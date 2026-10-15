import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superhero_app/data/model/superhero_response.dart';

class Repository {
  Future<SuperheroResponse?> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse(
        "https://superheroapi.com/api/7ef53a2ba0efdc544c4ddc3e8a199a89/search/$name",
      ),
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      SuperheroResponse superHeroResponse = SuperheroResponse.fromJson(
        decodedJson,
      );
      return superHeroResponse;
    } else {
      return null;
    }
  }
}
