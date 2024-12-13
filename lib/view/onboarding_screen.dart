import 'package:flutter/material.dart';
import 'package:flutterapp/view/signup.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/landing11.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Welcome text
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 50.0), // Adjusted top padding for one finger
              child: SafeArea(
                child: Text(
                  "Welcome to\nHealthBag",
                  style: TextStyle(
                    color: Colors.white, // Customize the color
                    fontSize: 48, // Adjust the font size
                    fontWeight: FontWeight.bold, // Bold font
                    fontFamily:
                        'Roboto', // Set a custom font (if added to the project)
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 5.0,
                        color:
                            Colors.black38, // Add shadow for better visibility
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom-right button with right arrow
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 5.0,
                  bottom: 20.0), // Slightly moved the button to the right
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the SignUpScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  backgroundColor:
                      const Color.fromARGB(255, 59, 166, 253), // Button color
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white, // Icon color
                  size: 27,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
