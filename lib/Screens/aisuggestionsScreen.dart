import 'package:flutter/material.dart';
import 'package:powerdown_frontend/widgets/navbar.dart'; // Import your BottomNavBar widget

class AiSuggestionsScreen extends StatefulWidget {
  const AiSuggestionsScreen({Key? key}) : super(key: key);

  @override
  _AiSuggestionsScreenState createState() => _AiSuggestionsScreenState();
}

class _AiSuggestionsScreenState extends State<AiSuggestionsScreen> {
  int _selectedIndex = 1; // Keep Analytics active
  double _containerHeight = 570.0; // Fixed height for the suggestions box

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        Navigator.pushReplacementNamed(
            context, '/addRoom'); // Navigate to Home
      } else if (index == 1) {
        Navigator.pushReplacementNamed(
            context, '/analytics'); // Navigate to Analytics
      } else if (index == 2) {
        Navigator.pushReplacementNamed(
            context, '/achievements'); // Navigate to Achievements
      } else if (index == 3) {
        Navigator.pushReplacementNamed(
            context, '/profile'); // Navigate to Profile
      }

      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Mock AI suggestions
  final List<String> aiSuggestions = [
    "This is an AI suggestion in order to lower energy consumption.",
    "This is an AI suggestion in order to lower energy consumption.",
    "This is an AI suggestion in order to lower energy consumption.",
    "This is an AI suggestion in order to lower energy consumption.",
    "This is an AI suggestion in order to lower energy consumption.",
    "This is an AI suggestion in order to lower energy consumption.",
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Suggestions',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false, // Disable default back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black), // Custom back icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: _containerHeight, // Fixed height controlled in code
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255,245,253,239), // Light green background
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: aiSuggestions
                    .map((suggestion) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "• $suggestion",
                            style: const TextStyle(
                              fontSize: 18, // Increased text size
                              color: Colors.black,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      // Bottom Nav Bar with Analytics still selected
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Handle navigation on tap
      ),
    );
  }
}
