import 'package:get_it/get_it.dart';
import 'package:sapdos_app/features/patientdashboard/data/datasource/fetch_local_data.dart';
import 'package:sapdos_app/features/patientdashboard/data/repositories/fetch_data_impl.dart';
import 'package:sapdos_app/features/patientdashboard/domain/repositories/fetch_data_repo.dart';
import 'package:sapdos_app/features/patientdashboard/domain/usecases/fetch_user_doctor_usecase.dart';
import 'package:sapdos_app/features/patientdashboard/presentation/bloc/bloc/user_with_doctor_bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  //datasource
  sl.registerLazySingleton<UserWithDoctorsRemoteDataSource>(
      () => UserWithDoctorsRemoteDataSourceImpl());

//repository
  sl.registerLazySingleton<UserWithDoctorsRepository>(() =>
      UserWithDoctorsRepositoryImpl(
          remoteDataSource: sl<UserWithDoctorsRemoteDataSource>()));

//usecase
  sl.registerLazySingleton<FetchUserDoctorUsecase>(() => FetchUserDoctorUsecase(
      userWithDoctorsRepository: sl<UserWithDoctorsRepository>()));

  //bloc
  sl.registerFactory<UserWithDoctorsBloc>(
      () => UserWithDoctorsBloc(sl<FetchUserDoctorUsecase>()));
}
