import 'package:flutter/material.dart';
import 'package:flutterapp/view/dashboard.dart';
import 'package:flutterapp/view/login.dart';
import 'package:flutterapp/view/onboarding_screen.dart';
import 'package:flutterapp/view/signup.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/output': (context) => const OnboardingScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
