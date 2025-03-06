import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor.dart';
import 'see_all_doctors_event.dart';
import 'see_all_doctors_state.dart';

class SeeAllDoctorsCubit extends Bloc<SeeAllDoctorsEvent, SeeAllDoctorsState> {
  SeeAllDoctorsCubit() : super(DoctorsLoading());

  @override
  Stream<SeeAllDoctorsState> mapEventToState(SeeAllDoctorsEvent event) async* {
    if (event is LoadDoctorsEvent) {
      try {
        // Simulate loading doctors from an API or local database
        await Future.delayed(const Duration(seconds: 2));

        final List<Doctor> doctors = [
          Doctor(
              name: 'Josh Ben',
              specialty: 'Dentist',
              image: 'assets/images/doc.png',
              rating: 4.8),
          Doctor(
              name: 'Ben Parker',
              specialty: 'Dermatologist',
              image: 'assets/images/doc.png',
              rating: 4.7),
          Doctor(
              name: 'Jack Dev',
              specialty: 'Physician',
              image: 'assets/images/doc.png',
              rating: 4.6),
          Doctor(
              name: 'Emma Watson',
              specialty: 'Cardiologist',
              image: 'assets/images/doc.png',
              rating: 4.9),
          Doctor(
              name: 'Sophia Brown',
              specialty: 'Neurologist',
              image: 'assets/images/doc.png',
              rating: 4.5),
        ];

        yield DoctorsLoaded(doctors: doctors);
      } catch (e) {
        yield DoctorsError(error: 'Failed to load doctors');
      }
    }
  }

  void loadDoctors() => add(LoadDoctorsEvent());
}
