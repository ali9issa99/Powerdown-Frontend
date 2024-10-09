import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:powerdown_frontend/widgets/navbar.dart'; // Import your BottomNavBar widget
import 'package:shared_preferences/shared_preferences.dart';

class AiSuggestionsScreen extends StatefulWidget {
  final String userId; // Pass userId when navigating

  const AiSuggestionsScreen({Key? key, required this.userId}) : super(key: key);

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

  // Function to fetch token from SharedPreferences
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token'); // Retrieve the stored JWT token
  }

  // Function to fetch userId from SharedPreferences
  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<void> fetchAiSuggestions() async {
    final String? token =
        await getToken(); // Get JWT token from SharedPreferences
    final String? userId =
        await getUserId(); // Get userId from SharedPreferences

    // If token or userId is not found, show an error
    if (token == null || userId == null) {
      setState(() {
        aiSuggestions = ["No token or user ID found. Please log in again."];
        isLoading = false;
      });
      return;
    }

    print(
        "JWT Token: $token, UserId: $userId"); // Print the token and userId for debugging

    final url = Uri.parse(
        'http://10.0.2.2:8080/users/$userId/aisuggestions'); // Correct API URL

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Attach JWT token here
      });

      print(
          "Response Status Code: ${response.statusCode}"); // Log the status code
      print(
          "Response Body: ${response.body}"); // Log the response body for debugging

      if (response.statusCode == 200) {
        // Ensure the response is a valid JSON object and 'aiSuggestions' is a list
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse['aiSuggestions'] != null &&
            jsonResponse['aiSuggestions'] is List) {
          final List<dynamic> suggestionsJson = jsonResponse['aiSuggestions'];

          // Check if the suggestions are complex objects or contain 'suggestions' field
          setState(() {
            aiSuggestions = suggestionsJson
                .map((suggestion) {
                  if (suggestion is Map<String, dynamic>) {
                    // Extract from 'suggestions' field instead of 'text'
                    return suggestion['suggestions']?.toString() ??
                        'Unknown Suggestion';
                  } else if (suggestion is String) {
                    return suggestion;
                  } else {
                    return 'Invalid Suggestion';
                  }
                })
                .cast<String>() // Ensure casting to List<String>
                .toList();
            isLoading = false; // Stop loading once data is fetched
          });
        } else {
          setState(() {
            aiSuggestions = ["No suggestions available."];
            isLoading = false;
          });
        }
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
      print("Error: $error"); // Log the error for debugging
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
      body: SingleChildScrollView(
        child: Padding(
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
                    : aiSuggestions
                            .isNotEmpty // Check if there are any suggestions
                        ? SizedBox(
                            height: _containerHeight -
                                50, // Adjust height to fit inside the container
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...aiSuggestions.map((suggestion) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          "• $suggestion",
                                          style: const TextStyle(
                                            fontSize: 18, // Increased text size
                                            color: Colors.black,
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                      height:
                                          10), // Add some space before the button
                                  ElevatedButton(
                                    onPressed:
                                        fetchAiSuggestions, // Refresh suggestions
                                    child: const Text('Refresh Suggestions'),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Center(
                            child: Text(
                              "No suggestions available.",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
              ),
            ],
          ),
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
