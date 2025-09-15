import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanGanjilGenap extends StatefulWidget {
  const HalamanGanjilGenap({super.key});

  @override
  State<HalamanGanjilGenap> createState() => _HalamanGanjilGenapState();
}

class _HalamanGanjilGenapState extends State<HalamanGanjilGenap> {
  final TextEditingController pengontrolAngka = TextEditingController();
  String hasil = '';

  void _cekAngka() {
    int? angka = int.tryParse(pengontrolAngka.text);
    if (angka != null) {
      setState(() {
        if (angka % 2 == 0) {
          hasil = '$angka adalah bilangan genap.';
        } else {
          hasil = '$angka adalah bilangan ganjil.';
        }
      });
    } else {
      setState(() {
        hasil = 'Input tidak valid.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Ganjil/Genap', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: pengontrolAngka,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan Angka'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cekAngka,
              style: ElevatedButton.styleFrom(
                textStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Cek'),
            ),
            const SizedBox(height: 30),
            Text(
              hasil,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}