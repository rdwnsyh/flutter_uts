import 'package:flutter/material.dart';
import 'screens/index_page.dart';
import 'screens/terima_kasih_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Praktikum',
      // Konfigurasi tema aplikasi
      theme: ThemeData(
        // Mengatur skema warna dengan warna dasar biru
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          background: Colors.blue.shade50,
        ),
        fontFamily: 'Roboto',
        // Konfigurasi default untuk semua TextField
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade200),
          ),
        ),
      ),
      // Konfigurasi routing aplikasi
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/thanks': (context) => const ThankYouPage(),
      },
    );
  }
}
