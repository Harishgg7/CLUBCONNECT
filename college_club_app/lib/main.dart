import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const ClubConnectApp());
}

class ClubConnectApp extends StatelessWidget {
  const ClubConnectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClubConnect',
      debugShowCheckedModeBanner: false, // Add this line to remove debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}
