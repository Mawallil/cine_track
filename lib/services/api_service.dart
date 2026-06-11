import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  // Note: In a real app, this key should be kept in a secure .env file
  // For capstone purposes, we are demonstrating API integration structure
  static const String _apiKey = '8db0e0d5a329d2f2d9f48529e875080a'; 

  Future<List<Movie>> getTrendingMovies() async {
    print('Fetching trending movies...');
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/trending/movie/day?api_key=$_apiKey'),
      );
      print('Trending API Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        print('Fetched ${results.length} trending movies');
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        print('Error response: ${response.body}');
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      print('Network Error: $e');
      // Fallback to mock data if API fails or for demo purposes
      return _getMockMovies();
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    print('Searching for: $query');
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=${Uri.encodeComponent(query)}'),
      );
      print('Search API Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        print('Found ${results.length} search results');
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        print('Search error response: ${response.body}');
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      print('Search Network Error: $e');
      return [];
    }
  }

  List<Movie> _getMockMovies() {
    return [
      Movie(
        id: 1,
        title: 'Interstellar',
        overview: 'The adventures of a group of explorers who make use of a newly discovered wormhole...',
        posterPath: '/gEU2QvYBebqSnu9RblYmqPjaSxs.jpg',
        backdropPath: '/rAiDLpS8X8mYIqK729hN966XSST.jpg',
        rating: 8.4,
        releaseDate: '2014-11-05',
      ),
      Movie(
        id: 2,
        title: 'Inception',
        overview: 'A thief who steals corporate secrets through the use of dream-sharing technology...',
        posterPath: '/o0o7UBQ7m1Y6vB3O5v6q6v6v6v6.jpg', // Updated to a placeholder-like path if original is failing
        backdropPath: '/8ZTVqvKDQ8PznTrSccS0p412UvP.jpg',
        rating: 8.3,
        releaseDate: '2010-07-15',
      ),
    ];
  }
}
