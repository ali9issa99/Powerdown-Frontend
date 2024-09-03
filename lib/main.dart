import 'package:flutter/material.dart';
import 'package:powerdown_frontend/Screens/welcomeScreen.dart'; 
import 'package:powerdown_frontend/Screens/loginScreen.dart'; 
import 'package:powerdown_frontend/Screens/signupScreen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(), 
        '/signup': (context) => const SignUpScreen(), 
      },
    );
  }
}