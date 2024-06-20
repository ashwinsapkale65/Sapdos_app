import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/core/bloc/change_screen.dart';
import 'package:sapdos_app/presentation/atoms/custom_auth_button.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class InitialOnboardingWidget extends StatelessWidget {
  const InitialOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Login to your sapdos account or \n              create one now',
            style: TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(19, 35, 90, 1)),
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            isTrue: true,
            text: "LOGIN",
            onTap: () {
              BlocProvider.of<OnboardingBloc>(context).add(LoginEvent());
            },
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
            isTrue: false,
            text: "SIGN-UP",
            onTap: () {
              BlocProvider.of<OnboardingBloc>(context).add(RegisterEvent());
            },
          ),
          SizedBox(
            height: 70,
          ),
          Text('Proceed as a Guest',
              style: TextStyle(
                  fontFamily: 'Sans',
                  fontSize: 25,
                  decoration: TextDecoration.underline)),
        ],
      ),
    );
  }
}
