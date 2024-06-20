import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sapdos_app/features/onboarding/register/domain/entities/user_entity.dart';
import 'package:sapdos_app/features/onboarding/register/domain/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final RegisterUserUseCase registerUserUseCase;

  RegisterFormBloc({required this.registerUserUseCase})
      : super(RegisterFormState.initial()) {
    on<SubmitForm>(_onSubmitForm);
    on<UpdateEmail>(_onUpdateEmail);
    on<UpdatePassword>(_onUpdatePassword);
    on<UpdateConfirmPassword>(_onUpdateConfirmPassword);
    on<UpdateName>(_onUpdateName);
    on<UpdateSpecialization>(_onUpdateSpecialization);
    on<UpdateExperience>(_onUpdateExperience);
    on<UpdateDescription>(_onUpdateDescription);
    on<UpdateAge>(_onUpdateAge);
    on<UpdateDisease>(_onUpdateDisease);
    on<UpdateRole>(_onUpdateRole);
  }

  void _onSubmitForm(SubmitForm event, Emitter<RegisterFormState> emit) async {
    print('as');
    try {
      final user = UserEntity(
          name: state.nameController?.text,
          email: state.emailController?.text,
          password: state.passwordController?.text,
          role: state.role,
          specialization: state.specializationController?.text,
          experience: int.tryParse(state.experienceController?.text ?? '0'),
          description: state.descriptionController?.text,
          age: state.ageController?.text,
          disease: state.diseaseController?.text,
          archived: true,
          version: 1,
          active: true,
          createdOn: DateTime.now(),
          updatedOn: DateTime.now());
      print(user.name);

      final registeredUser = await registerUserUseCase.execute(user);

      emit(state.copyWith(
          isSubmitting: false, isSuccess: true, errorMessage: null));
    } catch (e) {
      emit(state.copyWith(
          isSubmitting: false, isSuccess: false, errorMessage: e.toString()));
    }
  }

  void _onUpdateEmail(UpdateEmail event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.email,
        selection: TextSelection.collapsed(offset: event.email.length),
      ),
    );
    emit(state.copyWith(emailController: newController));
  }

  void _onUpdatePassword(
      UpdatePassword event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.password,
        selection: TextSelection.collapsed(offset: event.password.length),
      ),
    );
    emit(state.copyWith(passwordController: newController));
  }

  bool _areAllFieldsFilled(RegisterFormState state) {
    if (state.role == null || state.role!.isEmpty) {
      return false;
    }

    if (state.role == 'Doctor') {
      return state.nameController?.text.isNotEmpty == true &&
          state.specializationController?.text.isNotEmpty == true &&
          state.experienceController?.text.isNotEmpty == true &&
          state.descriptionController?.text.isNotEmpty == true;
    } else if (state.role == 'Patient') {
      return state.nameController?.text.isNotEmpty == true &&
          state.ageController?.text.isNotEmpty == true &&
          state.diseaseController?.text.isNotEmpty == true;
    }

    return false;
  }

  void _onUpdateConfirmPassword(
      UpdateConfirmPassword event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.confirmPassword,
        selection:
            TextSelection.collapsed(offset: event.confirmPassword.length),
      ),
    );
    emit(state.copyWith(confirmPasswordController: newController));
  }

  void _onUpdateName(UpdateName event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.name,
        selection: TextSelection.collapsed(offset: event.name.length),
      ),
    );
    emit(state.copyWith(nameController: newController));
  }

  void _onUpdateSpecialization(
      UpdateSpecialization event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.specialization,
        selection: TextSelection.collapsed(offset: event.specialization.length),
      ),
    );
    emit(state.copyWith(specializationController: newController));
  }

  void _onUpdateExperience(
      UpdateExperience event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.experience,
        selection: TextSelection.collapsed(offset: event.experience.length),
      ),
    );
    emit(state.copyWith(experienceController: newController));
  }

  void _onUpdateDescription(
      UpdateDescription event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.description,
        selection: TextSelection.collapsed(offset: event.description.length),
      ),
    );
    emit(state.copyWith(descriptionController: newController));
  }

  void _onUpdateAge(UpdateAge event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.age,
        selection: TextSelection.collapsed(offset: event.age.length),
      ),
    );
    emit(state.copyWith(ageController: newController));
  }

  void _onUpdateDisease(UpdateDisease event, Emitter<RegisterFormState> emit) {
    final newController = TextEditingController.fromValue(
      TextEditingValue(
        text: event.disease,
        selection: TextSelection.collapsed(offset: event.disease.length),
      ),
    );
    emit(state.copyWith(diseaseController: newController));
  }

  void _onUpdateRole(UpdateRole event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(role: event.role));
  }
}
