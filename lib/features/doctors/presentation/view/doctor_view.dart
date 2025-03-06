import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_profile.dart';
import 'see_all_doctors_cubit.dart';
import 'see_all_doctors_state.dart';

class SeeAllDoctorsPage extends StatelessWidget {
  const SeeAllDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SeeAllDoctorsCubit()..loadDoctors(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Doctors'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocBuilder<SeeAllDoctorsCubit, SeeAllDoctorsState>(
          builder: (context, state) {
            if (state is DoctorsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DoctorsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: state.doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = state.doctors[index];
                    return doctorListTile(
                      context,
                      doctor.name,
                      doctor.specialty,
                      doctor.image,
                      doctor.rating,
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text('Error loading doctors'));
            }
          },
        ),
      ),
    );
  }

  Widget doctorListTile(BuildContext context, String name, String specialty,
      String imagePath, double rating) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty, style: const TextStyle(color: Colors.grey)),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                Text(rating.toString(), style: const TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorProfile(
                  name: name,
                  specialty: specialty,
                  imagePath: imagePath,
                  experience: 10,
                  price: 10,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
