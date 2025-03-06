import 'package:flutter/material.dart';
import 'package:flutterapp/core/app_theme/app_theme.dart';
import 'package:flutterapp/core/app_theme/theme_provider.dart';
import 'package:flutterapp/view/dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealthBag',
      theme: getApplicationTheme(
          isDarkMode: Provider.of<ThemeProvider>(context).isDarkMode),
      home: const Dashboard(),
    );
  }
}
