import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/database_service.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final DatabaseService _dbService = DatabaseService();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final status = await _dbService.isFavorite(widget.movie.id);
    if (mounted) {
      setState(() {
        _isFavorite = status;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    if (_isFavorite) {
      await _dbService.removeFavorite(widget.movie.id);
    } else {
      await _dbService.insertFavorite(widget.movie);
    }
    _checkFavoriteStatus();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isFavorite ? 'Removed from Watchlist' : 'Added to Watchlist'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  color: const Color(0xFF1E293B),
                  child: widget.movie.backdropPath.isNotEmpty
                    ? Image.network(
                        widget.movie.backdropPath.startsWith('http')
                          ? widget.movie.backdropPath
                          : 'https://image.tmdb.org/t/p/original${widget.movie.backdropPath}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Center(
                          child: Icon(Icons.broken_image, color: Colors.white24, size: 50),
                        ),
                      )
                    : const Center(
                        child: Icon(Icons.movie, color: Colors.white24, size: 50),
                      ),
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withValues(alpha: 0.5),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFF59E0B), size: 20),
                      const SizedBox(width: 4),
                      Text(
                        widget.movie.rating.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        widget.movie.releaseDate.split('-')[0],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        widget.movie.duration,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 8,
                    children: widget.movie.genres.map((genre) => Chip(
                      label: Text(genre),
                      backgroundColor: const Color(0xFF1E293B),
                      labelStyle: const TextStyle(color: Colors.white),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    )).toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Synopsis',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.movie.overview,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: _toggleFavorite,
                    icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
                    label: Text(_isFavorite ? 'Remove from Watchlist' : 'Add to Watchlist'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
