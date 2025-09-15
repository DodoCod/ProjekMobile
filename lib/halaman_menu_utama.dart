import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'halaman_data_kelompok.dart';
import 'halaman_kalkulator.dart';
import 'halaman_ganjil_genap.dart';
import 'halaman_jumlah_angka.dart';

class HalamanMenuUtama extends StatelessWidget {
  const HalamanMenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buatItemMenu(context, 'Data Kelompok', Icons.group, const HalamanDataKelompok()),
            _buatItemMenu(context, 'Kalkulator', Icons.calculate, const HalamanKalkulator()),
            _buatItemMenu(context, 'Ganjil/Genap', Icons.numbers, const HalamanGanjilGenap()),
            _buatItemMenu(context, 'Jumlah Angka', Icons.format_list_numbered, const HalamanJumlahAngka()),
          ],
        ),
      ),
    );
  }

  Widget _buatItemMenu(BuildContext context, String judul, IconData ikon, Widget halaman) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => halaman),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ikon, size: 50, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(
              judul,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}