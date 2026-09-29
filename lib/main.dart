import 'package:flutter/material.dart'; // Import library UI Flutter

import 'pages/login.dart'; // Import halaman login

// Fungsi utama — titik awal aplikasi
void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi (StatelessWidget karena tidak ada state berubah)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culinariez',
      debugShowCheckedModeBanner: false, // Hilangkan banner DEBUG
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF7986CB), // Warna utama app
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8F9FD),
        useMaterial3: true,
        // Tema Card
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        // Tema AppBar
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        // Tema Input Field
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF9FA8DA), width: 1.5),
          ),
        ),
        // Tema Tombol
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: const Color(0xFF7986CB),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      home: const LoginPage(), // Halaman pertama = Login
    );
  }
}
