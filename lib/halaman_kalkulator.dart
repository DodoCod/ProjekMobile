import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanKalkulator extends StatefulWidget {
  const HalamanKalkulator({super.key});

  @override
  State<HalamanKalkulator> createState() => _HalamanKalkulatorState();
}

class _HalamanKalkulatorState extends State<HalamanKalkulator> {
  final TextEditingController pengontrolAngka1 = TextEditingController();
  final TextEditingController pengontrolAngka2 = TextEditingController();
  double hasil = 0.0;
  String operatorSaatIni = '+';

  void _hitung() {
    double angka1 = double.tryParse(pengontrolAngka1.text) ?? 0;
    double angka2 = double.tryParse(pengontrolAngka2.text) ?? 0;
    
    setState(() {
      switch (operatorSaatIni) {
        case '+':
          hasil = angka1 + angka2;
          break;
        case '-':
          hasil = angka1 - angka2;
          break;
        case '*':
          hasil = angka1 * angka2;
          break;
        case '/':
          if (angka2 != 0) {
            hasil = angka1 / angka2;
          } else {
            hasil = double.infinity;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tidak bisa dibagi dengan nol.')),
            );
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Sederhana', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: pengontrolAngka1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Pertama',
                prefixIcon: Icon(Icons.looks_one),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: pengontrolAngka2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Kedua',
                prefixIcon: Icon(Icons.looks_two),
              ),
            ),
            const SizedBox(height: 30),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['+', '-', '*', '/'].map((String op) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operatorSaatIni = op;
                        });
                        _hitung();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: operatorSaatIni == op ? Theme.of(context).primaryColor : Colors.grey[300],
                        foregroundColor: operatorSaatIni == op ? Colors.white : Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(op, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Theme.of(context).primaryColor, width: 1),
              ),
              child: Column(
                children: [
                  Text(
                    'Hasil:',
                    style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    hasil == double.infinity ? 'ERROR' : hasil.toStringAsFixed(2),
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}