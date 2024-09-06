import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  int _selectedIndex = 0; // Tracks the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Home',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false, // Removes the back arrow
        actions: [
          IconButton(
            onPressed: () {
              // Logic for the custom icon button
            },
            icon: SvgPicture.asset(
              'assets/icons/plus.svg', // Path to your custom icon
              width: 32,
              height: 32,
            ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Sets the current index
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped, // Handles tap events
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 24,
              height: 24,
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey, // Change color based on selection
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/analytics.svg',
              width: 24,
              height: 24,
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey, // Change color based on selection
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/achievements.svg',
              width: 24,
              height: 24,
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey, // Change color based on selection
            ),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              width: 24,
              height: 24,
              color: _selectedIndex == 3 ? Colors.blue : Colors.grey, // Change color based on selection
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
