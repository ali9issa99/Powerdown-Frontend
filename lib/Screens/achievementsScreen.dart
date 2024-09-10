import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:powerdown_frontend/widgets/navbar.dart';

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Achievements'),
        // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes the back button
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAchievementCard(
              'Great start! Your home is already becoming more energy efficient!',
              '25%',
              0.25,
              'assets/badges/medal.png', // First image path
            ),
            SizedBox(height: 16),
            _buildAchievementCard(
              'Halfway there! Your energy-saving efforts are making a big impact!',
              '50%',
              0.50,
              'assets/badges/trophy.png', // Second image path
            ),
            SizedBox(height: 16),
            _buildAchievementCard(
              'Almost at the finish line! Your home is now a model of efficiency!',
              '75%',
              0.75,
              'assets/badges/emerald.png', // Third image path
            ),
            SizedBox(height: 16),
            _buildAchievementCard(
              "Amazing work! You've mastered energy-saving and maximized your home\'s efficiency!",
              '100%',
              1.0,
              'assets/badges/diamond.png', // Fourth image path
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2, // Set to Achievements tab index
        onItemTapped: (int index) {
          // Handle the navigation logic here based on the tapped index
          if (index == 0) {
            Navigator.pushNamed(context, '/home'); // Example route for Home
          } else if (index == 1) {
            Navigator.pushNamed(context, '/analytics'); // Example route for Analytics
          } else if (index == 2) {
            // Stay on Achievements page
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile'); // Example route for Profile
          }
        },
      ),
    );
  }

  Widget _buildAchievementCard(
    String text,
    String progressText,
    double progress,
    String imagePath, // New parameter to accept the image path
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, height: 80), // Uses the provided image path
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.grey[800]),
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
        SizedBox(height: 4),
        Text(progressText, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
