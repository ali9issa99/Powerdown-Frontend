import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/navbar.dart'; // Ensure you import your BottomNavBar

class OverviewScreen extends StatelessWidget {
  final int selectedIndex; // Add selectedIndex to the constructor

  const OverviewScreen({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Energy Usage Overview',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black), // Custom back icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Energy Usage',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '2.1 kW',
              style: TextStyle(
                fontSize: 28,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Get an overview of your smart home\'s data to optimize your energy savings.',
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconText(Icons.flash_on, '48 kWh', '24hr Usage'),
                _buildIconText(Icons.attach_money, '\$5.20', 'Estimated Cost'),
              ],
            ),
            SizedBox(height: 50),
            Text(
              'Energy Consumption Tracker',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Column( // Changed from Row to Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• Monthly energy usage 165 kWh.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '• Monthly goal reduce usage to 300 kWh.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '• Progress 45% achieved.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Added space between text and circular progress
            Center( // Center the circular progress indicator horizontally
              child: _buildCircularProgress(0.45),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex, // Pass selectedIndex
        onItemTapped: (index) {
          Navigator.pushReplacementNamed(context, '/analytics'); // Handle bottom nav item tap
        },
      ),
    );
  }

  // Customizable Icon-Text widget
  Widget _buildIconText(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, size: 48, color: Colors.grey), // Increased icon size and color
        SizedBox(width: 12), // Increased spacing
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 20, // Increased value text size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 16, // Increased label text size
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Customizable Circular Progress Indicator
  Widget _buildCircularProgress(double progress) {
    return SizedBox(
      width: 200,  // Adjusted width for the circle
      height: 200, // Adjusted height for the circle
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 150, // Make the inner circle slightly smaller
            height: 150, // Inner circle height
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 26, // Adjust this to control thickness
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 30, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
