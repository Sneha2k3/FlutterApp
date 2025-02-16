part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadImage extends RegisterEvent {
  final File file;

  const LoadImage({
    required this.file,
  });
}

class LoadCoursesAndBatches extends RegisterEvent {}

class RegisterStudent extends RegisterEvent {
  final BuildContext context;
  final String firstName;
  final String lastName;
  final String phone;
  final String username;
  final String password;
  final String? image;

  const RegisterStudent({
    required this.context,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.password,
    this.image,
  });
}
