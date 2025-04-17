import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cocktail.dart';

class CocktailService {
  static Future<List<Cocktail>> fetchCocktails(String query) async {
    final url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> drinks = data['drinks'] ?? [];
      return drinks.map((e) => Cocktail.fromJson(e)).toList();
    } else {
      throw Exception('Ошибка загрузки коктейлей');
    }
  }
}
