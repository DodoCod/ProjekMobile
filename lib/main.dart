import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Tambahkan ini

import 'splash_screen.dart'; // Import splash screen yang akan kita buat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Aplikasi Mobile',
      theme: ThemeData(
        // Skema warna yang lebih modern
        primaryColor: Colors.red[700],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.redAccent, // Warna aksen
        ),
        // Gaya teks global menggunakan Google Fonts (tambahan, perlu pubspec)
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[700],
          foregroundColor: Colors.white, // Warna teks AppBar
          elevation: 0, // Tanpa bayangan
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[700], // Warna tombol
            foregroundColor: Colors.white,     // Warna teks tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Sudut tombol membulat
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Sudut input membulat
            borderSide: BorderSide(color: Colors.red[700]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.redAccent, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
      home: const SplashScreen(), // Mulai dengan splash screen
    );
  }
}