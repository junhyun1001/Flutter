import 'dart:convert';
import 'package:http/http.dart' as http;
import 'food_model.dart';

var url =
    'http://openapi.foodsafetykorea.go.kr/api/5e61f5af77c04c20923a/I2790/json/1/1000/DESC_KOR=';

Future<Food> fetchFood(String foodName) async {
  print('fetchFood()');
  final response = await http.get(Uri.parse(url + foodName));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Food.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load FoodData');
  }
}
