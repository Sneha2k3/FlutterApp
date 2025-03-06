import 'package:dio/dio.dart';
import 'package:flutterapp/features/doctor/data/model/doctor_api_model.dart';
import 'package:flutterapp/features/doctor/domain/entity/doctor_entity.dart';

import '../../../../../app/constants/api_endpoints.dart';

class DoctorRemoteDataSource {
  final Dio _dio;

  DoctorRemoteDataSource(this._dio);

  Future<List<DoctorEntity>> getAllDoctors() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllDoctor);
      if (response.statusCode == 200) {
        var data = response.data as List<dynamic>;
        return data
            .map((doctor) => DoctorApiModel.fromJson(doctor).toEntity())
            .toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
