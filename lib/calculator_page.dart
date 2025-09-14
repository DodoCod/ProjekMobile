import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double _result = 0.0;
  String _operator = '+';

  void _calculate() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (_operator) {
        case '+':
          _result = num1 + num2;
          break;
        case '-':
          _result = num1 - num2;
          break;
        case '*':
          _result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            _result = num1 / num2;
          } else {
            _result = double.infinity; // Untuk menunjukkan error "dibagi nol"
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
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Pertama',
                prefixIcon: Icon(Icons.looks_one),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Kedua',
                prefixIcon: Icon(Icons.looks_two),
              ),
            ),
            const SizedBox(height: 30),

            // Pilihan Operator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['+', '-', '*', '/'].map((String op) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _operator = op;
                        });
                        _calculate(); // Hitung langsung setelah operator dipilih
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _operator == op ? Theme.of(context).primaryColor : Colors.grey[300],
                        foregroundColor: _operator == op ? Colors.white : Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(op, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),

            // Tampilan Hasil
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
                    _result == double.infinity ? 'ERROR' : _result.toStringAsFixed(2), // Format 2 angka di belakang koma
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