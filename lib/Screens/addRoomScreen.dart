import 'package:flutter/material.dart';

class AddRoomScreen extends StatelessWidget {
  const AddRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home'),
        actions: [
          IconButton(
            onPressed: () {
              // Action when the add button is pressed
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(flex: 3), // To provide flexible spacing from the top
            Text(
              'Click on the add button to add\n"Rooms" and "Devices"',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 2), // To provide flexible spacing from the bottom
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for adding rooms and devices
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: 0, // Default active tab is 'Home'
  type: BottomNavigationBarType.fixed,
  items: [
    BottomNavigationBarItem(
      icon: Icon(CustomIcons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(CustomIcons.analytics),
      label: 'Analytics',
    ),
    BottomNavigationBarItem(
      icon: Icon(CustomIcons.achievements),
      label: 'Achievements',
    ),
    BottomNavigationBarItem(
      icon: Icon(CustomIcons.profile),
      label: 'Profile',
    ),
  ],
),

    );
  }
}


