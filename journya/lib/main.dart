import 'package:flutter/material.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/welcome_screen.dart';
import 'presentation/screens/create_account_screen.dart';
import 'presentation/screens/sign_in_screen.dart';
import 'presentation/screens/onboarding_screen.dart';

void main() {
  runApp(MyApp()); // ❌ Remove const
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journya App',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // ❌ Remove const
        '/onboarding': (context) => const OnboardingScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/signin': (context) => const SignInScreen(),
      },
    );
  }
}
