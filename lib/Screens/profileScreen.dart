import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Set background color to white
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
            // User Avatar
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/profile.png'), // Use your avatar image
            ),
            const SizedBox(height: 20),
            // User Name
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            // User Email
            const Text(
              'johndoe@email.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            // Profile Options
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Profile details'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigation to Profile Details screen
              },
              tileColor: Colors.grey[200], // Background color of the list item
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.black),
              title: const Text('Push Notifications'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigation to Notifications screen
              },
              tileColor: Colors.grey[200], // Background color of the list item
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle logout functionality
              },
              tileColor: Colors.grey[200], // Background color of the list item
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
