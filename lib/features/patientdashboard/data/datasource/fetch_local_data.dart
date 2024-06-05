import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sapdos_app/features/patientdashboard/domain/entities/user_doctor_entity.dart';

abstract class UserWithDoctorsRemoteDataSource {
  Future<UserWithDoctor> fetchUserWithDoctors();
}

class UserWithDoctorsRemoteDataSourceImpl
    implements UserWithDoctorsRemoteDataSource {
  @override
  Future<UserWithDoctor> fetchUserWithDoctors() async {
    try {
      final response =
          await rootBundle.loadString('assets/images/doctors_list.json');
      final jsonMap = json.decode(response);
   
      return UserWithDoctor.fromJson(jsonMap);
    } catch (e) {
      throw e;
    }
  }
}
