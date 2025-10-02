import 'package:flutter/material.dart';
import 'food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 🔑 Simpan status simpan per movie (pakai Set biar gampang)
  final Set<int> savedMovies = {};

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Makanan"),
        actions: [
          IconButton(
            tooltip: "Logout",
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (username != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Selamat datang, $username 👋",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: foodMenuList.length,
              itemBuilder: (context, index) {
                final v = foodMenuList[index];
                final isSaved = savedMovies.contains(index);

                return Card(
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        v.imageUrls.isNotEmpty ? v.imageUrls[0] : "",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) =>
                            const Icon(Icons.movie, size: 40),
                      ),
                    ),
                    title: Text(
                      "${v.name}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(v.category),
                        Row(
                          children: [
                            const Icon(Icons.money, size: 16, color: Colors.orange),
                            const SizedBox(width: 4),
                            Text("Harga: ${v.price}"),
                          ],
                        ),
                      ],
                    ),
                    // 🔑 Tombol Simpan (bookmark)
                    trailing: IconButton(
                      icon: Icon(
                        isSaved ? Icons.star : Icons.star_border,
                        color: isSaved ? Colors.blue : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isSaved) {
                            savedMovies.remove(index);
                          } else {
                            savedMovies.add(index);
                          }
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: v,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
