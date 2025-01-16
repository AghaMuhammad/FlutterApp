import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart'; // Add this import for TapGestureRecognizer
import 'package:journya/sign_in_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isChecked = false; // Checkbox state

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
                    'Create Account',
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
                    context,
                    label: 'E-mail address',
                    hint: 'Email',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 10),
                  // Password Field
                  _buildTextField(
                    context,
                    label: 'Password',
                    hint: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  // Confirm Password Field
                  _buildTextField(
                    context,
                    label: 'Confirm Password',
                    hint: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  // Strength Bars
                  _buildStrengthBars(),
                  const SizedBox(height: 10),
                  // Password Requirements
                  Text(
                    'Use 8 or more characters with a mix of letters, numbers & symbols to be secure.',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Terms and Privacy Policy
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'By proceeding, you agree to our ',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            children: [
                              TextSpan(
                                text: 'Privacy Policy ',
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.teal,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              const TextSpan(text: 'and '),
                              TextSpan(
                                text: 'Term of Use',
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
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
                  const SizedBox(height: 20),
                  // Get Started Button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: isChecked
                          ? () {
                              // Handle Get Started
                            }
                          : null, // Disable button if not checked
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Get started!',
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
                  // Sign In Text
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Do you already have an account? ',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.teal,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInScreen(), // Replace with your Sign In Screen
                                  ),
                                );
                              },
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
  Widget _buildTextField(BuildContext context,
      {required String label,
      required String hint,
      required IconData icon,
      bool obscureText = false}) {
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

  // Helper method to create strength bars
  Widget _buildStrengthBars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => Expanded(
          child: Container(
            height: 5,
            margin: EdgeInsets.only(right: index < 3 ? 4 : 0),
            decoration: BoxDecoration(
              color: index == 0 ? Colors.teal : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
