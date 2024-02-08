import 'package:flutter_application_2_dogapp/model/dog_model.dart';
import 'package:http/http.dart' as http;

class DogService {
  final String apiUrl = 'https://dog.ceo/api/breeds/image/random';

  Future<Dog> getRandomDog() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return dogFromJson(response.body);
    } else {
      throw Exception('Failed to fetch dog image');
    }
  }
}
