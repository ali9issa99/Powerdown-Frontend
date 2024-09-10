import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For the graph/chart
import 'package:powerdown_frontend/Screens/aisuggestionsScreen.dart';
import 'package:powerdown_frontend/widgets/navbar.dart'; // Import your BottomNavBar widget
import 'overviewScreen.dart'; // Import the OverviewScreen
// import 'aiSuggestionsScreen.dart'; // Import the AiSuggestionsScreen

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int _selectedIndex = 1; // Set the index to 1 for Analytics

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/addRoom'); // Replacing current route with Home
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/analytics'); // Replacing current route with Analytics
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/achievements'); // Replacing current route with Achievements
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/profile'); // Replacing current route with Profile
      }

      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Consumption Analysis',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            backgroundColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Placeholder for the graph/chart
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 50),
                        FlSpot(1, 70),
                        FlSpot(2, 60),
                        FlSpot(3, 90),
                        FlSpot(4, 75),
                        FlSpot(5, 55),
                        FlSpot(6, 40),
                      ],
                      isCurved: true,
                      // colors: [Colors.blue],
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "This week's energy use is 5% lower than last week - great job conserving!",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OverviewScreen(selectedIndex: _selectedIndex), // Pass selectedIndex
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: const Color(0xFF004D40),
              ),
              child: const Text(
                'View Detailed Report',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AiSuggestionsScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: const Color(0xFF004D40),
              ),
              child: const Text(
                'AI Suggestions',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Handle navigation on tap
      ),
    );
  }
}
