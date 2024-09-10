import 'package:flutter/material.dart';
import 'navbar.dart'; // Import your BottomNavBar

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  _ProfileDetailsScreenState createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  int selectedIndex = 3; // Set the initial index to Profile (Index 3)

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Add navigation logic for different screens
    switch (index) {
      case 0:
        // Navigate to Home Screen
        Navigator.pushReplacementNamed(context, '/home');
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
        // Navigate back to Profile Screen
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black), // Back arrow like the image
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: 'john', // Initial value for Name field
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: 'doe', // Initial value for Email field
              decoration: InputDecoration(
                labelText: 'E-mail',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle submit logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0F4C5C), // Color similar to the one in the image
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
