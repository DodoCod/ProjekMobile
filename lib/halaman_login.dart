import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'halaman_menu_utama.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final TextEditingController pengontrolNamaPengguna = TextEditingController();
  final TextEditingController pengontrolSandi = TextEditingController();

  final Map<String, String> dataAnggotaKelompok = {
    'fernando': '124230125',
    'syaiful': '124230132',
    'raya': '124230137',
    'panji': '124230160',
  };

  void _prosesLogin() {
    if (dataAnggotaKelompok[pengontrolNamaPengguna.text.toLowerCase()] == pengontrolSandi.text) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HalamanMenuUtama()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama pengguna atau NIM salah.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20),
              Text(
                'Selamat Datang',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Silakan login untuk melanjutkan',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),

              TextField(
                controller: pengontrolNamaPengguna,
                decoration: const InputDecoration(
                  labelText: 'Nama Pengguna',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: pengontrolSandi,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'NIM (Sandi)',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _prosesLogin,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('MASUK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}