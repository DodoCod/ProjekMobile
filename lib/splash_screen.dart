import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Tambahkan ini
import 'login_page.dart'; // Import halaman login

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {}); // Tahan selama 2 detik
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Warna latar belakang sesuai tema
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Anda bisa tambahkan logo atau gambar di sini
            const Icon(
              Icons.app_registration, // Contoh ikon
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              'Aplikasi Tugas Kelompok',
              style: GoogleFonts.poppins( // Menggunakan Google Fonts
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Versi 1.0',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}