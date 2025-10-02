import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'movie_data.dart';

class DetailScreen extends StatelessWidget {
  final MovieModel movie;
  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar utama
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                movie.imgUrl.isNotEmpty ? movie.imgUrl : "",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) =>
                    const Icon(Icons.image_not_supported, size: 100),
              ),
            ),
            const SizedBox(height: 16),

            // Judul & genre
            Text(
              movie.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              movie.genre,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const Divider(height: 32),

            // Spesifikasi
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aktris: ${movie.casts.join(', ')}",
                  softWrap: true,
                ),
                const SizedBox(height: 4),
                Text(
                  "Sutradara: ${movie.director}",
                  softWrap: true,
                ),
              ],
            ),

            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  "Rating: ${movie.rating}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),

            const Divider(height: 32),

            // Tombol Wikipedia
            Center(
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => _launchURL(movie.movieUrl),
                icon: const Icon(Icons.open_in_new),
                label: const Text(
                  "Buka Wikipedia",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
