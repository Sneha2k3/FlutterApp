import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/cubit/onboarding_cubit.dart';
import 'package:flutterapp/cubit/onboarding_state.dart';
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
      body: BlocProvider(
        create: (_) => OnboardingCubit(),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return PageView(
              onPageChanged: (index) {
                context.read<OnboardingCubit>().updatePageIndex(index);
              },
              children: [
                // Page 1
                OnboardingPage(
                  imagePath: 'assets/images/landing22.jpg',
                  title: "Welcome to \nHealthBag",
                  description: "Your Health, Your Priority",
                  pageIndex: state.pageIndex,
                ),

                // Page 2
                OnboardingPage(
                  imagePath: 'assets/images/landingg.jpg',
                  title: "Book appointments \nseamlessly",
                  description:
                      "Monitor your health data anytime, anywhere, and stay ahead with real-time updates and insights.",
                  slogan: "Stay Informed, Stay Healthy",
                  pageIndex: state.pageIndex,
                ),

                // Page 3
                OnboardingPage(
                  imagePath: 'assets/images/landing33.jpg',
                  title: "Achieve Your Health Goals",
                  description:
                      "Set personalized goals, track progress, and achieve milestones for a healthier you.",
                  slogan: "Empower Your Wellness Journey",
                  isFinalPage: true,
                  pageIndex: state.pageIndex,
                  onButtonPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
