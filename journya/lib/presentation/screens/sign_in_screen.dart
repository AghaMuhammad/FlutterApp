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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha((0.8 * 255).toInt()),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.1 * 255).toInt()),
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
                  const SizedBox(height: 80),
                  // Title
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.poppins(
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
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 10),
                  // Password Field
                  _buildTextField(
                    label: 'Password',
                    hint: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  // Remember Me and Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: const BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Checkbox(
                              value: false,
                              onChanged: (value) {},
                              activeColor: const Color(0xFF00BFA6),
                            ),
                          ),
                          Text(
                            'Remember me',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Forgot password?',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Sign In Button
                  SizedBox(
                    width: 350, // Custom width
                    height: 48, // Custom height
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Sign In
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00BFA6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
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
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: GoogleFonts.poppins(
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
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            suffixIcon: Icon(icon, color: Colors.black45),
            filled: true,
            fillColor: Colors.transparent, // Transparent fill
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.grey, width: 1), // Increased width
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.grey, width: 1), // Increased width
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF00BFA6), // Teal border when focused
                width: 2, // Increased width
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context, String text, dynamic icon) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade400, // Light gray color
          width: 1.0, // Thinner border
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          // Handle Sign-In
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon is String
                ? Image.asset(
                    icon,
                    height: 24,
                  )
                : Icon(
                    icon,
                    size: 24,
                    color: Colors.black,
                  ), // Adjusted icon size
            const SizedBox(width: 8),
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
