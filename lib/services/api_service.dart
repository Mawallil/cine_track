import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  // Note: In a real app, this key should be kept in a secure .env file
  // For capstone purposes, we are demonstrating API integration structure
  static const String _apiKey = '8db0e0d5a329d2f2d9f48529e875080a'; 

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/trending/movie/day?api_key=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      // Fallback to mock data if API fails or for demo purposes
      return _getMockMovies();
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=$query'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      return [];
    }
  }

  List<Movie> _getMockMovies() {
    return [
      Movie(
        id: 1,
        title: 'Interstellar',
        overview: 'The adventures of a group of explorers who make use of a newly discovered wormhole...',
        posterPath: 'https://image.tmdb.org/t/p/w500/gEU2QvYBebqSnu9RblYmqPjaSxs.jpg',
        backdropPath: 'https://image.tmdb.org/t/p/original/rAiDLpS8X8mYIqK729hN966XSST.jpg',
        rating: 8.4,
        releaseDate: '2014-11-05',
      ),
      Movie(
        id: 2,
        title: 'Inception',
        overview: 'A thief who steals corporate secrets through the use of dream-sharing technology...',
        posterPath: 'https://image.tmdb.org/t/p/w500/edv5CZvRjS99ayvP66mRznFW9Uu.jpg',
        backdropPath: 'https://image.tmdb.org/t/p/original/8ZTVqvKDQ8PznTrSccS0p412UvP.jpg',
        rating: 8.3,
        releaseDate: '2010-07-15',
      ),
    ];
  }
}
