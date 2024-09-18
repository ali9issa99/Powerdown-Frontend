import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/navbar.dart';

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
        // Navigate back to Profile Screen
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  // Reuse label style from LoginScreen
  TextStyle _labelStyle() {
    return const TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
  }

  // Reuse TextField style from LoginScreen
  InputDecoration _buildTextFieldDecoration(String label) {
    return InputDecoration(
      hintText: label, // Match hintText as label
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  // Reuse button style from LoginScreen
  ButtonStyle _buildButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF004D40), // Button color
      padding: const EdgeInsets.symmetric(horizontal: 155, vertical: 16), // Match padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0), // Match border radius
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black), // Back arrow like the image
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile Details',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start, // Align items to the top
          children: [
            const SizedBox(height: 20), // Space at the top
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Match label style from LoginScreen
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 60, // Match TextField height from LoginScreen
              width: double.infinity, // Full width
              child: TextField(
                decoration: _buildTextFieldDecoration('John Doe'), // Match decoration
              ),
            ),
            const SizedBox(height: 20), // Space between fields
            const Text(
              'E-mail',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Match label style from LoginScreen
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 60, // Match TextField height from LoginScreen
              width: double.infinity, // Full width
              child: TextField(
                decoration: _buildTextFieldDecoration('johndoe@mail.com',), // Match decoration
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit logic here
                },
                style: _buildButtonStyle(), // Reuse the button style
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
