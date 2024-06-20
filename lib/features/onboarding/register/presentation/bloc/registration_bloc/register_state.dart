part of 'register_bloc.dart';

class RegisterFormState {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final TextEditingController? nameController;
  final TextEditingController? specializationController;
  final TextEditingController? experienceController;
  final TextEditingController? descriptionController;
  final TextEditingController? ageController;
  final TextEditingController? diseaseController;
  final String? role;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  RegisterFormState({
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.nameController,
    this.specializationController,
    this.experienceController,
    this.descriptionController,
    this.ageController,
    this.diseaseController,
    this.role,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  factory RegisterFormState.initial() {
    return RegisterFormState();
  }

  RegisterFormState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    TextEditingController? nameController,
    TextEditingController? specializationController,
    TextEditingController? experienceController,
    TextEditingController? descriptionController,
    TextEditingController? ageController,
    TextEditingController? diseaseController,
    String? role,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return RegisterFormState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController,
      nameController: nameController ?? this.nameController,
      specializationController: specializationController ?? this.specializationController,
      experienceController: experienceController ?? this.experienceController,
      descriptionController: descriptionController ?? this.descriptionController,
      ageController: ageController ?? this.ageController,
      diseaseController: diseaseController ?? this.diseaseController,
      role: role ?? this.role,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
