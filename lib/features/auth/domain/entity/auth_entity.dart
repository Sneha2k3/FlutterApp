import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String firstName;
  final String lastName;
  final String? image;
  final String phone;
  final String username;
  final String password;

  const AuthEntity({
    this.userId,
    required this.firstName,
    required this.lastName,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [userId, firstName, lastName, image, username, password, phone];
}
