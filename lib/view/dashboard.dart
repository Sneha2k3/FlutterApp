import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Hi, Ccr 👋',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'OpenSans Regular',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                print("Notification clicked!");
              },
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Keep taking care\nof your health',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans Bold',
                ),
              ),
              const SizedBox(height: 16),
              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontFamily: 'OpenSans Regular'),
                  ),
                  style: TextStyle(fontFamily: 'OpenSans Regular'),
                ),
              ),
              const SizedBox(height: 24),
              // Specialties section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Specialities',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans Bold',
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print("See All Specialities clicked!");
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(fontFamily: 'OpenSans Regular'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Pediatrics clicked!");
                      },
                      child:
                          _buildSpecialityCard('Pediatrics', Icons.child_care),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Neurology clicked!");
                      },
                      child:
                          _buildSpecialityCard('Neurology', Icons.psychology),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Dentist clicked!");
                      },
                      child: _buildSpecialityCard(
                          'Dentist', Icons.medical_services,
                          boxWidth: 160),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Popular Doctors section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Doctors',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans Bold',
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print("See All Popular Doctors clicked!");
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(fontFamily: 'OpenSans Regular'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("John Wilson profile clicked!");
                      },
                      child: _buildDoctorProfile(
                        'John Wilson',
                        'Cardiology',
                        'assets/images/doc.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Tim Smith profile clicked!");
                      },
                      child: _buildDoctorProfile(
                        'Tim Smith',
                        'Microbiologist',
                        'assets/images/doc2.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Alexa Ray profile clicked!");
                      },
                      child: _buildDoctorProfile(
                        'Alexa Ray',
                        'Neurologist',
                        'assets/images/doc.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                size: 28,
              ),
              onPressed: () {
                print("Home clicked!");
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                size: 28,
              ),
              onPressed: () {
                print("Appointments clicked!");
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.person_outline,
                size: 28,
              ),
              onPressed: () {
                print("Profile clicked!");
              },
            ),
          ],
        ),
      ),
    );
  }

  // Build speciality card
  static Widget _buildSpecialityCard(String title, IconData icon,
      {double boxWidth = 120}) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.all(16.0),
      width: boxWidth,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 237, 237),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: const Color.fromARGB(255, 73, 72, 72)),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans Bold',
                color: Color.fromARGB(255, 73, 72, 72)),
          ),
        ],
      ),
    );
  }

  // Build doctor profile card
  static Widget _buildDoctorProfile(
      String name, String specialty, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'OpenSans Bold'),
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'OpenSans Regular',
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
