import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:healthbag/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:healthbag/features/auth/domain/entity/auth_entity.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/repository/auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final currentUser = await _authLocalDataSource.getCurrentUser();
      return Right(currentUser);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> logincustomer(
    String email,
    String password,
  ) async {
    try {
      final token = await _authLocalDataSource.loginStudent(email, password);
      return Right(token);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerStudent(AuthEntity student) async {
    try {
      return Right(_authLocalDataSource.registerStudent(student));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
