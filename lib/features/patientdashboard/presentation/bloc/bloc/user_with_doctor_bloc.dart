import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sapdos_app/features/patientdashboard/domain/entities/user_doctor_entity.dart';
import 'package:sapdos_app/features/patientdashboard/domain/usecases/fetch_user_doctor_usecase.dart';

part 'user_with_doctor_event.dart';
part 'user_with_doctor_state.dart';

class UserWithDoctorsBloc
    extends Bloc<UserWithDoctorsEvent, UserWithDoctorsState> {
  final FetchUserDoctorUsecase usecase;

  UserWithDoctorsBloc(this.usecase) : super(UserWithDoctorsInitial()) {
    on<FetchUserWithDoctors>(_fetchUserWithDoctors);
  }

  void _fetchUserWithDoctors(
      FetchUserWithDoctors event, Emitter<UserWithDoctorsState> emit) async {
    emit(UserWithDoctorsLoading());
    try {
      final userWithDoctors = await usecase.call();

      if (userWithDoctors == null) {
        emit(UserWithDoctorsError('Failed to fetch user with doctors'));
      } else {
        emit(UserWithDoctorsLoaded(userWithDoctors));
      }
    } catch (e) {
      emit(UserWithDoctorsError('Failed to fetch user with doctors'));
    }
  }
}
