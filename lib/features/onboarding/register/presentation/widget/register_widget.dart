import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/core/bloc/change_screen.dart';
import 'package:sapdos_app/core/injector/dependency_injection.dart';
import 'package:sapdos_app/features/onboarding/register/presentation/bloc/registration_bloc/register_bloc.dart';

import 'package:sapdos_app/presentation/atoms/cusrom_auth_textformfield.dart';
import 'package:sapdos_app/presentation/atoms/custom_auth_button.dart';

import 'package:sapdos_app/presentation/molecules/auth_title_field.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterFormBloc(
        registerUserUseCase: sl(),
      ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  const AuthTitleField(
                    title: "Register",
                    subtitle: "Enter new account's details",
                  ),
                  const SizedBox(height: 50),
                  BlocBuilder<RegisterFormBloc, RegisterFormState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomTextFormField(
                            prefixIcon: Icons.email,
                            hintText: "Email address/Phone No.",
                            isPasswordField: false,
                            tcontroller: state.emailController,
                            onChanged: (value) => context
                                .read<RegisterFormBloc>()
                                .add(UpdateEmail(value)),
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                            prefixIcon: Icons.lock,
                            hintText: "Password",
                            isPasswordField: true,
                            tcontroller: state.passwordController,
                            onChanged: (value) => context
                                .read<RegisterFormBloc>()
                                .add(UpdatePassword(value)),
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                            prefixIcon: Icons.lock,
                            hintText: "Confirm Password",
                            isPasswordField: true,
                            tcontroller: state.confirmPasswordController,
                            onChanged: (value) => context
                                .read<RegisterFormBloc>()
                                .add(UpdateConfirmPassword(value)),
                          ),
                          const SizedBox(height: 30),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Select Role",
                              border: OutlineInputBorder(),
                            ),
                            value:
                                state.role?.isEmpty ?? true ? null : state.role,
                            items: ['Doctor', 'Patient'].map((String role) {
                              return DropdownMenuItem<String>(
                                value: role,
                                child: Text(role),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              context
                                  .read<RegisterFormBloc>()
                                  .add(UpdateRole(newValue!));
                            },
                          ),
                          const SizedBox(height: 30),
                          if (state.role == 'Doctor') ...[
                            CustomTextFormField(
                              prefixIcon: Icons.person,
                              hintText: "Name",
                              isPasswordField: false,
                              tcontroller: state.nameController,
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(UpdateName(value)),
                            ),
                            const SizedBox(height: 30),
                            CustomTextFormField(
                              prefixIcon: Icons.medical_services,
                              hintText: "Specialization",
                              isPasswordField: false,
                              tcontroller: state.specializationController,
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(UpdateSpecialization(value)),
                            ),
                            const SizedBox(height: 30),
                            CustomTextFormField(
                              prefixIcon: Icons.work,
                              hintText: "Experience",
                              isPasswordField: false,
                              tcontroller: state.experienceController,
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(UpdateExperience(value)),
                            ),
                            const SizedBox(height: 30),
                            CustomTextFormField(
                              prefixIcon: Icons.description,
                              hintText: "Description",
                              isPasswordField: false,
                              tcontroller: state.descriptionController,
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(UpdateDescription(value)),
                            ),
                          ],
                          if (state.role == 'Patient') ...[
                            CustomTextFormField(
                              prefixIcon: Icons.person,
                              hintText: "Name",
                              isPasswordField: false,
                              tcontroller: state.nameController,
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(UpdateName(value)),
                            ),
                            const SizedBox(height: 30),
                            CustomTextFormField(
                              prefixIcon: Icons.cake,
                              hintText: "Age",
                              isPasswordField: false,
                              tcontroller: state.ageController,
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(UpdateAge(value)),
                            ),
                            const SizedBox(height: 30),
                            CustomTextFormField(
                              prefixIcon: Icons.local_hospital,
                              hintText: "Disease",
                              isPasswordField: false,
                              tcontroller: state.diseaseController,
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(UpdateDisease(value)),
                            ),
                          ],
                          const SizedBox(height: 30),
                          CustomButton(
                            isTrue: true,
                            text: "SIGN-UP",
                            onPressed: _areAllFieldsFilled(state)
                                ? () {
                                    context
                                        .read<RegisterFormBloc>()
                                        .add(SubmitForm());
                                  }
                                : null,
                          ),
                          const SizedBox(height: 20),
                          if (state.isSubmitting)
                            const CircularProgressIndicator(
                              backgroundColor: AppColors.primary,
                            )
                          else if (state.isSuccess)
                            const Text(
                              'Registration Successful!',
                              style: TextStyle(color: Colors.green),
                            )
                          else if (state.errorMessage != null)
                            Text(
                              'Error: ${state.errorMessage}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Already on Sapdos? ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFonts.secondary,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign-in",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFonts.secondary,
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to sign-in screen
                                      BlocProvider.of<OnboardingBloc>(context)
                                          .add(LoginEvent());
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
