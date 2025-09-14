import 'package:flutter/material.dart';

class SumOfDigitsPage extends StatefulWidget {
  const SumOfDigitsPage({super.key});

  @override
  State<SumOfDigitsPage> createState() => _SumOfDigitsPageState();
}

class _SumOfDigitsPageState extends State<SumOfDigitsPage> {
  final TextEditingController _inputController = TextEditingController();
  int _result = 0;

  void _calculateSum() {
    String input = _inputController.text;
    int sum = 0;
    for (int i = 0; i < input.length; i++) {
      int? digit = int.tryParse(input[i]);
      if (digit != null) {
        sum += digit;
      }
    }
    setState(() {
      _result = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumlah Total Angka'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan deretan angka'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 20),
            Text('Jumlah total: $_result', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}