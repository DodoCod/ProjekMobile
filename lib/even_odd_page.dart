import 'package:flutter/material.dart';

class EvenOddPage extends StatefulWidget {
  const EvenOddPage({super.key});

  @override
  State<EvenOddPage> createState() => _EvenOddPageState();
}

class _EvenOddPageState extends State<EvenOddPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _checkNumber() {
    int? number = int.tryParse(_numberController.text);
    if (number != null) {
      setState(() {
        if (number % 2 == 0) {
          _result = '$number adalah bilangan genap.';
        } else {
          _result = '$number adalah bilangan ganjil.';
        }
      });
    } else {
      setState(() {
        _result = 'Input tidak valid.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Ganjil/Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan Angka'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkNumber,
              child: const Text('Cek'),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}