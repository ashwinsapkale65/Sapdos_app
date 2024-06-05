import 'package:sapdos_app/features/patientdashboard/domain/entities/user_doctor_entity.dart';

abstract class UserWithDoctorsRepository {
  Future<UserWithDoctor> getUserWithDoctors();
}
