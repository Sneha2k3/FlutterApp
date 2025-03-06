import 'package:core/app_theme/theme_provider.dart';
import 'package:features/dashboard/presentation/view_model/dashboard_cubit.dart';
import 'package:features/dashboard/presentation/view_model/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'appointment.dart';
import 'doctor_profile.dart';
import 'see_all_doctor.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hi, Orange 👋'),
          actions: [
            Switch(
              value: context.watch<ThemeProvider>().isDarkMode,
              onChanged: (value) {
                context.read<ThemeProvider>().toggleTheme();
              },
            ),
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                context.read<ThemeProvider>().toggleTheme();
              },
            ),
          ],
        ),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return state.views[state.selectedIndex];
          },
        ),
        bottomNavigationBar: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Appointments',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context.read<DashboardCubit>().onTabTapped(index);
              },
            );
          },
        ),
      ),
    );
  }
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(DashboardState(views: [
          const HomeView(),
          const AppointmentView(),
          const ProfileView()
        ], selectedIndex: 0));

  void onTabTapped(int index) {
    emit(DashboardState(views: state.views, selectedIndex: index));
  }
}

class DashboardState {
  final List<Widget> views;
  final int selectedIndex;

  DashboardState({required this.views, required this.selectedIndex});
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Keep taking care \n of your health',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Specialties',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child:
                    const Text('See All', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          // Add other widgets like specialty cards, popular doctors, etc.
        ],
      ),
    );
  }
}

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Appointments Page'));
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Page'));
  }
}
