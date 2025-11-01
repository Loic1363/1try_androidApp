//===========================================================================================
// LoginApp Flutter Application
// ------------------------------------------------------------------------------------------
// This Dart file contains the main entry point and builds the main LoginPage widget
// for user authentication. The page is styled with a dark theme and includes validation
// logic for email along with navigation to a second page upon successful login.
// The code is organized into well-separated reusable widgets and functions for clarity
// and maintainability.
//===========================================================================================

import 'package:flutter/material.dart';
import 'functions/validators.dart';
import 'pages/page2.dart';

//===========================================================================================
// MainApp Widget
// ------------------------------------------------------------------------------------------
// This is the root widget of the application, wrapping the LoginPage in a MaterialApp.
// It applies a consistent dark scaffold background color theme across the app and
// disables the debug banner for a cleaner presentation.
//===========================================================================================
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login personnalisé',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//===========================================================================================
// LoginPage Widget
// ------------------------------------------------------------------------------------------
// Provides the login UI with input fields for email and password, styled with custom colors.
// Includes a sign in button managing input validation and navigation logic.
// Displays validation and authentication error messages inline below the inputs.
//===========================================================================================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Color primaryColor = const Color(0xFF9CA3AF);
  final Color secondaryColor = const Color(0xFF1A1A1A);
  final Color accentColor = const Color(0xFFFF5E5B);

  String? errorMessage;

  // Handles the logic when the user presses the Sign In button:
  // Validates email format, matches credentials, and navigates on success.
  void _onLoginPressed() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    setState(() {
      errorMessage = null;
    });

    if (!isValidEmail(email)) {
      setState(() {
        errorMessage = 'Email invalide';
      });
      return;
    }

    if (email == 'admin' && password == 'admin') {
      setState(() {
        errorMessage = null;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Page2()),
      );
    } else {
      setState(() {
        errorMessage = 'Login ou mot de passe incorrect';
      });
    }
  }

  // Builds the entire login page UI including logo, inputs, buttons, and messages.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/dataglow.png',
                height: 400,
                width: 400,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              _buildInputGroup(
                  label: 'EMAIL',
                  controller: _emailController,
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                  obscureText: false,
                  hintText: 'your@email.com'),
              _buildInputGroup(
                  label: 'PASSWORD',
                  controller: _passwordController,
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                  obscureText: true,
                  hintText: '••••••••'),
              if (errorMessage != null) ...[
                const SizedBox(height: 10),
                Text(errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14)),
              ],
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: secondaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: primaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: _onLoginPressed,
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 2,
                      color: primaryColor,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 2,
                      color: primaryColor,
                    )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ['G', 'F', 'X']
                    .map((label) => _buildSocialBtn(label, primaryColor))
                    .toList(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: primaryColor),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: null,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builds each labeled input field section with consistent styling.
  Widget _buildInputGroup({
    required String label,
    required TextEditingController controller,
    required Color primaryColor,
    required Color secondaryColor,
    required bool obscureText,
    required String hintText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(color: primaryColor),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: primaryColor.withOpacity(0.5)),
              filled: true,
              fillColor: secondaryColor,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Builds each social login button with hover and border styling.
  Widget _buildSocialBtn(String label, Color borderColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: borderColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
