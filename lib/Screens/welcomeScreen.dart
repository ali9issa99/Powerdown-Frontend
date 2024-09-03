import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/tv.png'), // Use this path for the image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
         
        ],
      ),
    );
  }
}
