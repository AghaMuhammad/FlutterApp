import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'create_account_screen.dart'; // Import the CreateAccountScreen file
import 'sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journya App',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/signin': (context) => const SignInScreen(),
      },
    );
  }
}
