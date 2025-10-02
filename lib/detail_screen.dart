import 'package:flutter/material.dart';
/*import 'package:url_launcher/url_launcher.dart';*/
import 'food.dart';

class DetailScreen extends StatelessWidget {
  final FoodMenu food;
  const DetailScreen({super.key, required this.food});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
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
                food.imageUrls.isNotEmpty ? food.imageUrls[0] : "",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) =>
                    const Icon(Icons.image_not_supported, size: 100),
              ),
            ),
            const SizedBox(height: 16),
            
            // Thumbnail carousel kecil
            if (food.imageUrls.length > 1)
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: food.imageUrls.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        food.imageUrls[index],
                        width: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) =>
                            const Icon(Icons.broken_image, size: 40),
                      ),
                    );
                  },
                ),
              ),

            // Judul & genre
            Text(
              food.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              food.price,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.blue
              ),
            ),
            Text(
              food.category,
              style: 
              const TextStyle(
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
                  "Deskripsi :"
                ),

                Text(
                  "${food.description}",
                  softWrap: true,
                ),
                const SizedBox(height: 4),
                Text(
                  "Bahan-bahan :"
                ),
                Text(
                  "${food.ingredients}",
                  softWrap: true,
                ),
                Text(
                  "Waktu Masak: ${food.cookingTime}",
                  softWrap: true,
                ),
              ],
            ),


            // Tombol Wikipedia
           /* Center(
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
                  "Open Wikipedia",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }

 /* Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  } */
}
