import 'package:flutter/material.dart';

class AddRoomScreen extends StatelessWidget {
  const AddRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Room'),
      ),
      body: Center(
        child: Text(
          'Add Room Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
