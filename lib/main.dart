import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'detail_screen.dart';
import 'movie_data.dart';

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Gais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 4,
          color: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      // Halaman awal adalah Login
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      // onGenerateRoute untuk passing object Movie ke DetailScreen
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final args = settings.arguments;
          if (args is MovieModel) {
            return MaterialPageRoute(
              builder: (context) => DetailScreen(movie: args),
            );
          }
        }
        return null;
      },
    );
  }
}