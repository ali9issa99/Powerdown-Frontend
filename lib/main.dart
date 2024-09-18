import 'package:flutter/material.dart';
import 'package:powerdown_frontend/Screens/welcomeScreen.dart'; 
import 'package:powerdown_frontend/Screens/loginScreen.dart'; 
import 'package:powerdown_frontend/Screens/signupScreen.dart'; 
import 'package:powerdown_frontend/Screens/homeScreen.dart';
import 'package:powerdown_frontend/Screens/analyticsScreen.dart'; 
import 'package:powerdown_frontend/Screens/achievementsScreen.dart';
import 'package:powerdown_frontend/Screens/profileScreen.dart';
import 'package:powerdown_frontend/Screens/roomDetails.dart';
import 'package:powerdown_frontend/provider/roomProvider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeviceProvider()),
        ChangeNotifierProvider(create: (_) => RoomProvider()),
        // Other providers...
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Smart Home App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
//         useMaterial3: true,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const WelcomeScreen(),
//         '/login': (context) => const LoginScreen(), 
//         '/signup': (context) => const SignUpScreen(), 
//         '/addRoom': (context) => const AddRoomScreen(),
//         '/analytics': (context) => AnalyticsScreen(),
//         '/achievements': (context) => AchievementsScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/roomDetails': (context) => RoomDetails(),
//       },
//     );
//   }
// }






 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/roomDetails') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return RoomDetails(
                roomName: args['roomName']!,
                imagePath: args['imagePath']!,
              );
            },
          );
        }
        // Handle other routes
        return MaterialPageRoute(
          builder: (context) {
            switch (settings.name) {
              case '/':
                return const WelcomeScreen();
              case '/login':
                return const LoginScreen();
              case '/signup':
                return const SignUpScreen();
              case '/addRoom':
                return const AddRoomScreen();
              case '/analytics':
                return AnalyticsScreen();
              case '/achievements':
                return AchievementsScreen();
              case '/profile':
                return ProfileScreen();
              default:
                return const WelcomeScreen();
            }
          },
        );
      },
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:powerdown_frontend/Screens/welcomeScreen.dart'; 
// import 'package:powerdown_frontend/Screens/loginScreen.dart'; 
// import 'package:powerdown_frontend/Screens/signupScreen.dart'; 
// import 'package:powerdown_frontend/Screens/homeScreen.dart';
// import 'package:powerdown_frontend/Screens/analyticsScreen.dart'; 
// import 'package:powerdown_frontend/Screens/achievementsScreen.dart';
// import 'package:powerdown_frontend/Screens/profileScreen.dart';
// import 'package:powerdown_frontend/provider/roomProvider.dart'; // Add the provider import
// import 'package:provider/provider.dart'; // Import provider package

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => deviceProvider()), // Register the deviceProvider
//       ],
//       child: const MyApp(), // Main app widget
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Smart Home App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
//         useMaterial3: true,
//       ),
//       initialRoute: '/', // Initial route set to WelcomeScreen
//       routes: {
//         '/': (context) => const WelcomeScreen(),
//         '/login': (context) => const LoginScreen(), 
//         '/signup': (context) => const SignUpScreen(), 
//         '/addRoom': (context) => const AddRoomScreen(),
//         '/analytics': (context) => AnalyticsScreen(),
//         '/achievements': (context) => AchievementsScreen(),
//         '/profile': (context) => ProfileScreen(),
//       },
//     );
//   }
// }
