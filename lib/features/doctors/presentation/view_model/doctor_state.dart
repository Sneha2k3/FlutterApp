import 'package:equatable/equatable.dart';

class SeeAllDoctorsState extends Equatable {
  const SeeAllDoctorsState();

  @override
  List<Object> get props => [];
}

class DoctorsLoading extends SeeAllDoctorsState {}

class DoctorsLoaded extends SeeAllDoctorsState {
  final List<Doctor> doctors;

  const DoctorsLoaded({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

class DoctorsError extends SeeAllDoctorsState {
  final String error;

  const DoctorsError({required this.error});

  @override
  List<Object> get props => [error];
}
