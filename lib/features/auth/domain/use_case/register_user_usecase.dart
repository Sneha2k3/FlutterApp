import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String firstName;
  final String lastName;
  final String phone;
  final String username;
  final String password;
  final String? image;

  const RegisterUserParams({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.password,
    this.image,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props =>
      [firstName, lastName, username, password, image, phone];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      firstName: params.firstName,
      lastName: params.lastName,
      phone: params.phone,
      username: params.username,
      password: params.password,
      image: params.image,
    );
    return repository.registerStudent(authEntity);
  }
}
