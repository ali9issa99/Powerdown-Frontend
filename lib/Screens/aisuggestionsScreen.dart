import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:powerdown_frontend/widgets/navbar.dart'; // Import your BottomNavBar widget

class AiSuggestionsScreen extends StatefulWidget {
  const AiSuggestionsScreen({Key? key}) : super(key: key);

  @override
  _AiSuggestionsScreenState createState() => _AiSuggestionsScreenState();
}

class _AiSuggestionsScreenState extends State<AiSuggestionsScreen> {
  int _selectedIndex = 1; // Keep Analytics active
  double _containerHeight = 570.0; // Fixed height for the suggestions box
  List<String> aiSuggestions = [];
  bool isLoading = true; // To handle loading state

  @override
  void initState() {
    super.initState();
    fetchAiSuggestions(); // Fetch suggestions on widget load
  }

  Future<void> fetchAiSuggestions() async {
    final String userId = "your_user_id"; // Replace with the actual user ID
    final url = Uri.parse(
        'http://10.0.2.2:8080/users/$userId/aisuggestions'); // Updated API URL

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer your_jwt_token', // Replace with actual JWT token if needed
      });

      if (response.statusCode == 200) {
        final List<dynamic> suggestionsJson =
            jsonDecode(response.body)['aiSuggestions'];
        setState(() {
          aiSuggestions =
              suggestionsJson.cast<String>(); // Cast to List<String>
          isLoading = false; // Stop loading once data is fetched
        });
      } else {
        // Handle non-200 responses
        setState(() {
          aiSuggestions = [
            "Failed to load suggestions. Please try again later."
          ];
          isLoading = false;
        });
      }
    } catch (error) {
      // Handle errors
      setState(() {
        aiSuggestions = ["Error occurred: $error"];
        isLoading = false;
      });
    }
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/addRoom'); // Navigate to Home
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'AI Suggestions',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            backgroundColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Disable default back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Colors.black), // Custom back icon
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
                color: const Color.fromARGB(
                    255, 245, 253, 239), // Light green background
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator()) // Show loader while fetching data
                  : Column(
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
