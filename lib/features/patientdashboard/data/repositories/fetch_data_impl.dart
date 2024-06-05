import 'package:sapdos_app/features/patientdashboard/data/datasource/fetch_local_data.dart';
import 'package:sapdos_app/features/patientdashboard/domain/entities/user_doctor_entity.dart';
import 'package:sapdos_app/features/patientdashboard/domain/repositories/fetch_data_repo.dart';

class UserWithDoctorsRepositoryImpl extends UserWithDoctorsRepository {
  final UserWithDoctorsRemoteDataSource remoteDataSource;

  UserWithDoctorsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<UserWithDoctor> getUserWithDoctors() async {
    try {
      final userwithdoctor = await remoteDataSource.fetchUserWithDoctors();

      return userwithdoctor;
    } catch (e) {
      print('Error fetching user with doctors: $e');
      throw e;
    }
  }
}
