import 'package:flutter/material.dart';

class GroupDataPage extends StatelessWidget {
  const GroupDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> groupMembers = [
      'Fernando Hosea Sihaloho [124230125]',
      'Syaiful Akmal Aufa Rofiqi [124230132]',
      'Muhammad Raya Pedang Putra [124230137]',
      'Kadek Panji Nugraha [124230160]'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Kelompok'),
      ),
      body: ListView.builder(
        itemCount: groupMembers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groupMembers[index]),
          );
        },
      ),
    );
  }
}