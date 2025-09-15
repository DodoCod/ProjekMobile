import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanJumlahAngka extends StatefulWidget {
  const HalamanJumlahAngka({super.key});

  @override
  State<HalamanJumlahAngka> createState() => _HalamanJumlahAngkaState();
}

class _HalamanJumlahAngkaState extends State<HalamanJumlahAngka> {
  final TextEditingController pengontrolInput = TextEditingController();
  int totalHasil = 0;

  void _hitungJumlah() {
    String input = pengontrolInput.text;
    int jumlah = 0;
    for (int i = 0; i < input.length; i++) {
      int? digit = int.tryParse(input[i]);
      if (digit != null) {
        jumlah += digit;
      }
    }
    setState(() {
      totalHasil = jumlah;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jumlah Total Angka', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: pengontrolInput,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan deretan angka'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungJumlah,
              style: ElevatedButton.styleFrom(
                textStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 30),
            Text(
              'Jumlah total: $totalHasil',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}