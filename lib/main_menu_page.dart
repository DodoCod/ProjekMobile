import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'group_data_page.dart';
import 'calculator_page.dart';
import 'even_odd_page.dart';
import 'sum_of_digits_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count( // Menggunakan GridView untuk tata letak yang menarik
          crossAxisCount: 2, // 2 kolom
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildMenuItem(context, 'Data Kelompok', Icons.group, const GroupDataPage()),
            _buildMenuItem(context, 'Kalkulator', Icons.calculate, const CalculatorPage()),
            _buildMenuItem(context, 'Ganjil/Genap', Icons.numbers, const EvenOddPage()),
            _buildMenuItem(context, 'Jumlah Angka', Icons.format_list_numbered, const SumOfDigitsPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell( // Membuat Card bisa ditekan
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(
              title,
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