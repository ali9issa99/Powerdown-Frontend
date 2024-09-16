import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/navbar.dart'; // Import your BottomNavBar
import 'package:powerdown_frontend/screens/profileDetails.dart'; // Import the ProfileDetails screen
import 'package:powerdown_frontend/screens/notificationScreen.dart'; // Make sure you have the correct import for NotificationScreen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 3; // Set the initial index to Profile (Index 3)

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Add navigation logic for different screens
    switch (index) {
      case 0:
        // Navigate to Home Screen
        Navigator.pushReplacementNamed(context, '/addRoom');
        break;
      case 1:
        // Navigate to Analytics Screen
        Navigator.pushReplacementNamed(context, '/analytics');
        break;
      case 2:
        // Navigate to Achievements Screen
        Navigator.pushReplacementNamed(context, '/achievements');
        break;
      case 3:
        // Already on Profile Screen, no action needed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'johndoe@email.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 60, // Adjust height of the ListTile
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: const Text(
                  'Profile details',
                  style: TextStyle(
                    fontSize: 18, // Adjust text size here
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to ProfileDetails screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileDetailsScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 60, // Adjust height of the ListTile
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                leading: const Icon(Icons.notifications, color: Colors.black),
                title: const Text(
                  'Push Notifications',
                  style: TextStyle(
                    fontSize: 18, // Adjust text size here
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to NotificationScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 60, // Adjust height of the ListTile
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18, // Adjust text size here
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle logout functionality
                },
              ),
            ),
          ],
        ),
      ),
      // Add BottomNavBar in the bottomNavigationBar property
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
