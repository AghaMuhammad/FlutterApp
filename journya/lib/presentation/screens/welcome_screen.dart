import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth * 0.85; // 85% of screen width
    final double buttonHeight = 50; // Fixed button height

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Journya Logo
                Image.asset(
                  'assets/images/letterJ.png',
                  height: 150,
                  width: 250,
                ),
                const SizedBox(height: 40),

                // Google Sign-In Button
                _buildSignInButton(
                  context,
                  text: 'Sign in with Google',
                  iconPath: 'assets/images/google_icon.png',
                  width: buttonWidth,
                  height: buttonHeight,
                  onPressed: () => _handleGoogleSignIn(context),
                ),
                const SizedBox(height: 12),

                // Apple Sign-In Button
                _buildSignInButton(
                  context,
                  text: 'Sign in with Apple',
                  iconData: FontAwesomeIcons.apple,
                  width: buttonWidth,
                  height: buttonHeight,
                  onPressed: () => _handleAppleSignIn(context),
                ),
                const SizedBox(height: 12),

                // Email Sign-In Button
                _buildSignInButton(
                  context,
                  text: 'Sign in with Email',
                  iconData: Icons.email,
                  width: buttonWidth,
                  height: buttonHeight,
                  onPressed: () => Navigator.pushNamed(context, '/signin'),
                ),
                const SizedBox(height: 16),

                // OR Divider
                _buildDivider(screenWidth, buttonWidth),

                const SizedBox(height: 16),

                // Create Account Button
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/create-account'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00BFA6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Terms & Privacy
                _buildTermsAndPrivacyText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Google Sign-In Handler (OAuth + MongoDB Backend)
  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        print("Google Sign-In Cancelled");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String idToken = googleAuth.idToken ?? "";

      final response = await http.post(
        Uri.parse('https://your-backend.com/api/auth/google'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"idToken": idToken}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String jwtToken = data['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', jwtToken);

        print("User signed in successfully!");
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        print("Google Sign-In Failed: ${response.body}");
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }

  // Apple Sign-In Handler (Placeholder)
  Future<void> _handleAppleSignIn(BuildContext context) async {
    print("Apple Sign-In Clicked");
  }

  // UI: Sign-In Button Builder
  Widget _buildSignInButton(BuildContext context,
      {required String text,
      String? iconPath,
      IconData? iconData,
      required double width,
      required double height,
      required VoidCallback onPressed}) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color.fromARGB(101, 155, 155, 155)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 55),
            if (iconPath != null)
              Image.asset(iconPath, height: 24)
            else if (iconData != null)
              Icon(iconData, size: 26, color: Colors.black),
            const SizedBox(width: 20),
            Text(
              text,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  // UI: OR Divider
  Widget _buildDivider(double screenWidth, double buttonWidth) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
            indent: (screenWidth - buttonWidth) / 2,
            endIndent: 10,
          ),
        ),
        Text(
          'OR',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 10,
            endIndent: (screenWidth - buttonWidth) / 2,
          ),
        ),
      ],
    );
  }

  // UI: Terms & Privacy Text
  Widget _buildTermsAndPrivacyText() {
    return Text.rich(
      TextSpan(
        text: 'By Signing up, You agree to our ',
        style: GoogleFonts.poppins(fontSize: 10, color: Colors.black),
        children: [
          TextSpan(
            text: 'Terms and Privacy Policy',
            style: GoogleFonts.poppins(fontSize: 10, color: Color(0xFF00BFA6)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
