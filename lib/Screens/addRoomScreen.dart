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
            icon: Image.asset(
              'assets/icons/home.svg',
              width: 24, // Adjust the width/height as needed
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/analytics.svg',
              width: 24,
              height: 24,
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/achievements.svg',
              width: 24,
              height: 24,
            ),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile.svg',
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
