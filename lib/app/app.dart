import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthbag/features/splash/presentation/onboarding_screen.dart';


import '../features/auth/presentation/view_model/login/login_bloc.dart';
import 'di/di.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Management',
      home: BlocProvider.value(
        value: getIt<LoginBloc>(),
        child: OnboardingScreen(),
      ),
    );
  }
}