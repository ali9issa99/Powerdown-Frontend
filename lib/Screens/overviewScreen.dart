import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/navbar.dart'; // Ensure you import your BottomNavBar

class OverviewScreen extends StatelessWidget {
  final int selectedIndex; // Add selectedIndex to the constructor

  const OverviewScreen({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Usage Overview'),
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
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '2.1 kW',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Get an overview of your smart home\'s data to optimize your energy savings.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconText(Icons.flash_on, '48 kWh', '24hr Usage'),
                _buildIconText(Icons.attach_money, '\$5.20', 'Estimated Cost'),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Energy Consumption Tracker',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• Monthly energy usage\n  165 kWh.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• Monthly goal reduce\n  usage to 300 kWh.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• Progress 45% achieved.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                _buildCircularProgress(0.45),
              ],
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

  Widget _buildIconText(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, size: 32, color: Colors.grey[600]),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircularProgress(double progress) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
