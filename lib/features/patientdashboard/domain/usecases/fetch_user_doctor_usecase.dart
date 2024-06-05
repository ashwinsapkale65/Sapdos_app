import 'package:sapdos_app/features/patientdashboard/domain/entities/user_doctor_entity.dart';
import 'package:sapdos_app/features/patientdashboard/domain/repositories/fetch_data_repo.dart';

class FetchUserDoctorUsecase {
  final UserWithDoctorsRepository userWithDoctorsRepository;

  FetchUserDoctorUsecase({required this.userWithDoctorsRepository});

  Future<UserWithDoctor> call() async {
    final result = await userWithDoctorsRepository.getUserWithDoctors();
    

    return result;
  }
}
