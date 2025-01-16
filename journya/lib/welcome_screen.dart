import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Enlarged Journya Logo
                Image.asset(
                  'assets/images/letterJ.png', // Replace with your logo image path
                  height: 150, // Logo height
                  width: 250, // Logo width
                ),
                const SizedBox(height: 40), // Reduced space
                // Sign-in Buttons
                _buildSignInButton(
                  context,
                  'Sign in with Google',
                  'assets/images/google_icon.png',
                ),
                const SizedBox(height: 12), // Reduced space
                _buildSignInButton(
                  context,
                  'Sign in with Apple',
                  FontAwesomeIcons.apple,
                ),
                const SizedBox(height: 12), // Reduced space
                _buildSignInButton(
                  context,
                  'Sign in with Email',
                  FontAwesomeIcons.envelope,
                ),
                const SizedBox(height: 16), // Reduced space
                // OR Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'OR',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Reduced space
                // Create Account Button
                SizedBox(
                  width: 295, // Same width as white buttons
                  height: 50, // Same height as white buttons
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/create-account', // Navigate to the Create Account screen
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF00BFA6), // Green background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ), // Match white buttons
                    ),
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Reduced space
                // Terms and Privacy Policy
                Text.rich(
                  TextSpan(
                    text: 'By Signing up, You agree to our ',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 10,
                        color: Colors.black45,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms and Privacy Policy',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF00BFA6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create sign-in buttons
  Widget _buildSignInButton(BuildContext context, String text, dynamic icon) {
    return SizedBox(
      width: 295, // Fixed width
      height: 50, // Explicit height for the button
      child: ElevatedButton(
        onPressed: () {
          // Handle Sign-In
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color.fromARGB(0, 255, 255, 255), // Transparent background
          elevation: 0, // Remove shadow
          minimumSize: const Size(280, 50), // Minimum button size
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
                color: Color.fromARGB(101, 155, 155, 155)), // Add border
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ), // Match green button
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 55), // Left padding for icon
            icon is String
                ? Image.asset(
                    icon, // Google Icon as an image
                    height: 24,
                  )
                : FaIcon(icon, size: 24, color: Colors.black), // Other Icons
            const SizedBox(width: 20),
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
