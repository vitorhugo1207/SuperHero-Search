import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hero.dart';

class HeroService {
  final String _apiKey = '';

  Future<List<Hero>> searchHero(String query) async {
    final response = await http.get(
      Uri.parse(
        'https://superheroapi.com/api/$_apiKey/search/$query',
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (data['response'] == 'success' && data['results'] != null) {
        final List<dynamic> results = data['results'] as List<dynamic>;
        return results.map((heroJson) => Hero.fromJson(heroJson)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load heroes: ${response.statusCode}');
    }
  }
}