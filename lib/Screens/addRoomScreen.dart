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
          children: [
            Spacer(flex: 2), // Decrease this value to move text up
            const Text(
              'Click on the add button to add\n"Rooms" and "Devices"',
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 2), // Increase this value to move text up
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
              _selectedIndex == 0
                  ? 'assets/activeIcons/home.svg' // Path to the active icon
                  : 'assets/icons/home.svg', // Path to the inactive icon
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1
                  ? 'assets/activeIcons/analytics.svg' // Path to the active icon
                  : 'assets/icons/analytics.svg', // Path to the inactive icon
              width: 24,
              height: 24,
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Image.asset(
                    'assets/activeIcons/achievements.png', // Path to the active PNG icon
                    width: 24,
                    height: 24,
                  )
                : SvgPicture.asset(
                    'assets/icons/achievements.svg', // Path to the inactive SVG icon
                    width: 24,
                    height: 24,
                  ),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 3
                  ? 'assets/activeIcons/profile.svg' // Path to the active icon
                  : 'assets/icons/profile.svg', // Path to the inactive icon
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
