import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back Button with Circle
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.black,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Title
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Email Field
                  _buildTextField(
                    label: 'E-mail address',
                    hint: 'Email',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 10),
                  // Password Field
                  _buildTextField(
                    label: 'Password',
                    hint: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  // Remember Me and Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Text(
                            'Remember me',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Forgot password?',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.teal,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Sign In Button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Sign In
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign In with Google Button
                  _buildSignInButton(
                    context,
                    'Sign in with Google',
                    'assets/images/google_icon.png',
                  ),
                  const SizedBox(height: 12),
                  // Sign In with Apple Button
                  _buildSignInButton(
                    context,
                    'Sign in with Apple',
                    Icons.apple,
                  ),
                  const SizedBox(height: 20),
                  // Don't Have an Account Text
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'If you don’t have an account yet? ',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.teal,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create text fields
  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            suffixIcon: Icon(icon, color: Colors.black45),
            filled: true,
            fillColor: Colors.white.withOpacity(0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to create sign-in buttons
  Widget _buildSignInButton(BuildContext context, String text, dynamic icon) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // Handle Sign-In
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            icon is String
                ? Image.asset(
                    icon,
                    height: 24,
                  )
                : Icon(icon, size: 24, color: Colors.black),
            const SizedBox(width: 20),
            Text(
              text,
              style: GoogleFonts.lato(
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
