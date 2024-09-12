import 'package:flutter/material.dart';
import 'package:powerdown_frontend/Screens/welcomeScreen.dart'; 
import 'package:powerdown_frontend/Screens/loginScreen.dart'; 
import 'package:powerdown_frontend/Screens/signupScreen.dart'; 
import 'package:powerdown_frontend/Screens/homeScreen.dart';
import 'package:powerdown_frontend/Screens/analyticsScreen.dart'; 
import 'package:powerdown_frontend/Screens/achievementsScreen.dart';
import 'package:powerdown_frontend/Screens/profileScreen.dart';
import 'package:powerdown_frontend/provider/roomProvider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(

    ChangeNotifierProvider(create: (context)=> deviceProvider(),child: const MyApp(),)
  );
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
        '/addRoom': (context) => const AddRoomScreen(),
        '/analytics': (context) => AnalyticsScreen(),
        '/achievements': (context) => AchievementsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}