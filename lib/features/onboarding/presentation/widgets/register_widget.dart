import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/features/onboarding/bloc/change_screen.dart';
import 'package:sapdos_app/presentation/atoms/cusrom_auth_textformfield.dart';
import 'package:sapdos_app/presentation/atoms/custom_auth_button.dart';
import 'package:sapdos_app/presentation/molecules/auth_title_field.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              AuthTitleField(
                title: "Register",
                subtitle: "Enter new account's details",
              ),
              SizedBox(height: 50),
              CustomTextFormField(
                prefixIcon: Icons.email,
                hintText: "Email address/Phone No.",
                isPasswordField: false,
              ),
              SizedBox(height: 30),
              CustomTextFormField(
                prefixIcon: Icons.lock,
                hintText: "Password",
                isPasswordField: true,
              ),
             const SizedBox(height: 30),
               CustomTextFormField(
                prefixIcon: Icons.lock,
                hintText: "Confirm Password",
                isPasswordField: true,
              ),
              SizedBox(height: 10),
              SizedBox(height: 80),
              CustomButton(
                isTrue: true,
                text: "SIGN-UP",
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already on Sapdos? ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppFonts.secondary,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Sign-in",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppFonts.secondary,
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        BlocProvider.of<OnboardingBloc>(context).add(LoginEvent());
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
