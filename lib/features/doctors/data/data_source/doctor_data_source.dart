import 'package:flutterapp/features/doctor/domain/entity/doctor_entity.dart';

abstract interface class IDoctorDataSource {
  Future<void> createDoctor(DoctorEntity doctorEntity);

  Future<List<DoctorEntity>> getAllDoctors();
}
