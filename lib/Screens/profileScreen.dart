import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  // Handle navigation to Profile Details screen
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
                  // Handle navigation to Notifications screen
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
    );
  }
}
