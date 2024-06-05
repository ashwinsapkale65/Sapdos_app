part of 'user_with_doctor_bloc.dart';

abstract class UserWithDoctorsState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserWithDoctorsInitial extends UserWithDoctorsState {}

class UserWithDoctorsLoading extends UserWithDoctorsState {}

class UserWithDoctorsLoaded extends UserWithDoctorsState {
  final UserWithDoctor userWithDoctors;

  UserWithDoctorsLoaded(this.userWithDoctors);

  @override
  List<Object> get props => [userWithDoctors];
}

class UserWithDoctorsError extends UserWithDoctorsState {
  final String message;

  UserWithDoctorsError(this.message);

  @override
  List<Object> get props => [message];
}
