import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For the graph/chart
import 'package:powerdown_frontend/widgets/navbar.dart'; // Import your BottomNavBar widget

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
      Navigator.pushReplacementNamed(context, '/addRoom');  // Replacing current route with Home
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/analytics');  // Replacing current route with Analytics
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/achievements');  // Replacing current route with Achievements
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/profile');  // Replacing current route with Profile
    }

    setState(() {
      _selectedIndex = index;
    });
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumption Analysis',
         style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
          ),
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
            // Button 1: View Detailed Report
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedReportScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.teal,
              ),
              child: const Text(
                'View Detailed Report',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            // Button 2: AI Suggestions
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
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.teal,
              ),
              child: const Text(
                'AI Suggestions',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      // Use your custom BottomNavBar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Handle navigation on tap
      ),
    );
  }
}

// Placeholder for DetailedReportScreen
class DetailedReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Report'),
      ),
      body: const Center(
        child: Text('Detailed Report Page'),
      ),
    );
  }
}

// Placeholder for AiSuggestionsScreen
class AiSuggestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Suggestions'),
      ),
      body: const Center(
        child: Text('AI Suggestions Page'),
      ),
    );
  }
}
