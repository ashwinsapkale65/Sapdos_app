part of 'register_bloc.dart';

abstract class RegisterFormEvent {}

class UpdateEmail extends RegisterFormEvent {
  final String email;
  UpdateEmail(this.email);
}

class UpdatePassword extends RegisterFormEvent {
  final String password;
  UpdatePassword(this.password);
}

class UpdateConfirmPassword extends RegisterFormEvent {
  final String confirmPassword;
  UpdateConfirmPassword(this.confirmPassword);
}

class UpdateRole extends RegisterFormEvent {
  final String role;
  UpdateRole(this.role);
}

class UpdateName extends RegisterFormEvent {
  final String name;
  UpdateName(this.name);
}

class UpdateSpecialization extends RegisterFormEvent {
  final String specialization;
  UpdateSpecialization(this.specialization);
}

class UpdateExperience extends RegisterFormEvent {
  final String experience;
  UpdateExperience(this.experience);
}

class UpdateDescription extends RegisterFormEvent {
  final String description;
  UpdateDescription(this.description);
}

class UpdateAge extends RegisterFormEvent {
  final String age;
  UpdateAge(this.age);
}

class UpdateDisease extends RegisterFormEvent {
  final String disease;
  UpdateDisease(this.disease);
}

class SubmitForm extends RegisterFormEvent {}