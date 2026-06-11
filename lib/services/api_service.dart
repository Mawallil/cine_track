import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  // TVMaze API is completely FREE and requires NO API KEY
  static const String _baseUrl = 'https://api.tvmaze.com';

  Future<List<Movie>> getTrendingMovies() async {
    print('Fetching trending shows from TVMaze...');
    try {
      // Fetching a list of high-weight (popular) shows
      final response = await http.get(
        Uri.parse('$_baseUrl/shows'),
      );
      print('TVMaze API Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        // Just take the first 20 popular shows
        final results = data.take(20).toList();
        print('Fetched ${results.length} shows');
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load shows');
      }
    } catch (e) {
      print('Network Error: $e');
      return [];
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    print('Searching TVMaze for: $query');
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/search/shows?q=${Uri.encodeComponent(query)}'),
      );
      print('Search API Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('Found ${data.length} results');
        return data.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search');
      }
    } catch (e) {
      print('Search Network Error: $e');
      return [];
    }
  }
}
