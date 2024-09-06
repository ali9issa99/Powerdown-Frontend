// lib/widgets/navbar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex, // Sets the current index
      type: BottomNavigationBarType.fixed,
      onTap: onItemTapped, // Handles tap events
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            selectedIndex == 0
                ? 'assets/activeIcons/home.svg' // Path to the active icon
                : 'assets/icons/home.svg', // Path to the inactive icon
            width: 24,
            height: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            selectedIndex == 1
                ? 'assets/activeIcons/analytics.svg' // Path to the active icon
                : 'assets/icons/analytics.svg', // Path to the inactive icon
            width: 24,
            height: 24,
          ),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 2
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
            selectedIndex == 3
                ? 'assets/activeIcons/profile.svg' // Path to the active icon
                : 'assets/icons/profile.svg', // Path to the inactive icon
            width: 24,
            height: 24,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
