part of 'user_with_doctor_bloc.dart';


abstract class UserWithDoctorsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUserWithDoctors extends UserWithDoctorsEvent {}