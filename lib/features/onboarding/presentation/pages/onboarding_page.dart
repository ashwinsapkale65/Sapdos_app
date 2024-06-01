import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/features/onboarding/bloc/change_screen.dart';
import 'package:sapdos_app/features/onboarding/presentation/widgets/inital_widget.dart';
import 'package:sapdos_app/features/login/presentaion/pages/login_widget.dart';
import 'package:sapdos_app/features/onboarding/presentation/widgets/register_widget.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 208, 227, 2),
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset(
              "assets/images/carenow.png",
              fit: BoxFit.cover,
            ),
          ),
          BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "SAPDOS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 65,
                        fontFamily: AppFonts.primary,
                        color: AppColors.primary,
                      ),
                    ),
                    if (state is InitialState) ...[
                      InitialOnboardingWidget(),
                    ] else if (state is LoginState) ...[
                      LoginWidget(),
                    ] else if (state is RegisterState) ...[
                      RegisterWidget(),
                    ],
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
