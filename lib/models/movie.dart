class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double rating;
  final String releaseDate;
  final String duration;
  final List<String> genres;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
    this.duration = '1h',
    this.genres = const [],
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // TVMaze search results wrap the object in a "show" field
    final show = json.containsKey('show') ? json['show'] : json;
    
    return Movie(
      id: show['id'] ?? 0,
      title: show['name'] ?? 'No Title',
      overview: (show['summary'] ?? 'No summary available.')
          .replaceAll(RegExp(r'<[^>]*>'), ''), // Remove HTML tags from TVMaze summary
      posterPath: show['image']?['medium'] ?? '',
      backdropPath: show['image']?['original'] ?? '',
      rating: (show['rating']?['average'] as num?)?.toDouble() ?? 0.0,
      releaseDate: show['premiered'] ?? 'N/A',
      duration: '${show['runtime'] ?? 60} min',
      genres: List<String>.from(show['genres'] ?? []),
    );
  }
}
