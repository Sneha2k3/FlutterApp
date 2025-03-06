import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/shared/token_shared_prefs.dart'; // Import token storage class
import 'package:flutterapp/view/dashboard.dart'; // Import your Dashboard page
import 'package:flutterapp/view/login.dart'; // Import your Login page
import 'package:flutterapp/view/signup.dart';

// Onboarding State
class OnboardingState extends Equatable {
  final int pageIndex;

  const OnboardingState({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}

// Onboarding Cubit
class OnboardingCubit extends Cubit<OnboardingState> {
  final LoginBloc _loginBloc;
  final TokenSharedPrefs _tokenSharedPrefs;

  OnboardingCubit(this._loginBloc, this._tokenSharedPrefs)
      : super(const OnboardingState(pageIndex: 0));

  Future<void> checkTokenAndNavigate(BuildContext context) async {
    await Future.delayed(
        const Duration(seconds: 1)); // Optional delay for smooth transition

    final tokenResult = await _tokenSharedPrefs.getToken();

    tokenResult.fold(
      (failure) {
        debugPrint("Error fetching token: ${failure.message}");
        _goToLogin(context);
      },
      (String? token) {
        if (token != null && token.trim().isNotEmpty) {
          // ✅ Token exists, go to HomePage
          debugPrint("✅ Token found: Navigating to Home");
          _goToHome(context);
        } else {
          debugPrint(" No token found: Navigating to Login");
          _goToLogin(context);
        }
      },
    );
  }

  void updatePageIndex(int index) {
    emit(OnboardingState(pageIndex: index));
  }

  void _goToLogin(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _loginBloc,
            child: const LoginView(),
          ),
        ),
      );
    }
  }

  void _goToHome(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    }
  }
}
