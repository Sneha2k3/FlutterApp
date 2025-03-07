import 'package:flutter/material.dart';
import 'package:flutterapp/view/dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Placeholder for the logo
                const SizedBox(height: 50),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.health_and_safety,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'HealthBag',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'OpenSans ExtraBold',
                  ),
                ),
                const SizedBox(height: 5),

                // Welcome text
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 29,
                    fontFamily: 'OpenSans ExtraBold',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Use Credentials to access your account',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans SemiBoldItalic',
                    color: Color.fromARGB(255, 113, 112, 112),
                  ),
                ),
                const SizedBox(height: 20),

                // Username field
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    hintText: 'Enter Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: 'OpenSans Bold',
                    ),
                  ),
                  style: const TextStyle(fontFamily: 'OpenSans Bold'),
                ),
                const SizedBox(height: 20),

                // Password field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility_off),
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: 'OpenSans Bold',
                    ),
                  ),
                  style: const TextStyle(fontFamily: 'OpenSans Bold'),
                ),
                const SizedBox(height: 10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password logic
                    },
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'OpenSans Bold',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Log In Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the DashboardScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'OpenSans Bold',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
