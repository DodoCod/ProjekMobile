import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanDataKelompok extends StatelessWidget {
  const HalamanDataKelompok({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> daftarAnggota = [
      'Fernando Hosea Sihaloho',
      'Syaiful Akmal Aufa Rofiqi',
      'Muhammad Raya Pedang Putra',
      'Kadek Panji Nugraha'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelompok', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: daftarAnggota.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
                title: Text(
                  daftarAnggota[index],
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}