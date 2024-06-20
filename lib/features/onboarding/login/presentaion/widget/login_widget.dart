import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/features/doctordashboard/presentation/pages/doctor_dashboard_page.dart';

import 'package:sapdos_app/core/bloc/change_screen.dart';
import 'package:sapdos_app/features/onboarding/login/presentaion/bloc/bloc/authentication_bloc.dart';
import 'package:sapdos_app/features/patientdashboard/presentation/pages/patient_dashboard_page.dart';
import 'package:sapdos_app/presentation/atoms/cusrom_auth_textformfield.dart';
import 'package:sapdos_app/presentation/atoms/custom_auth_button.dart';
import 'package:sapdos_app/presentation/molecules/auth_title_field.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          if (state.role == 'doctor') {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DoctorDashboardPage()));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PatientDashboardPage()));
          }
        } else if (state is AuthenticationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                AuthTitleField(
                  title: "Welcome Back",
                  subtitle: "Enter existing account's details",
                ),
                SizedBox(height: 50),
                CustomTextFormField(
                  tcontroller: emailController,
                  prefixIcon: Icons.email,
                  hintText: "Email address/Phone No.",
                  isPasswordField: false,
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  tcontroller: passwordController,
                  prefixIcon: Icons.lock,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            color: Color.fromRGBO(19, 35, 90, 1),
                            fontSize: 15,
                            fontFamily: 'Sans',
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Sans',
                          color: Color.fromRGBO(19, 35, 90, 1),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                CustomButton(
                  isTrue: true,
                  text: "LOGIN",
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(
                        LoginRequested(
                            email: emailController.text,
                            password: passwordController.text));
                  },
                ),
                SizedBox(height: 70),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Not on Spdos? ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFonts.secondary,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Sign-up",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFonts.secondary,
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            BlocProvider.of<OnboardingBloc>(context)
                                .add(RegisterEvent());
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
