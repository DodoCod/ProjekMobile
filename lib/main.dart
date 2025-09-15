import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'halaman_login.dart';

void main() {
  runApp(const AplikasiTugas());
}

class AplikasiTugas extends StatelessWidget {
  const AplikasiTugas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Aplikasi Mobile',
      theme: ThemeData(
        primaryColor: Colors.red[700],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.redAccent, 
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[700],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red[700]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.redAccent, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
      home: const HalamanLogin(),
    );
  }
}