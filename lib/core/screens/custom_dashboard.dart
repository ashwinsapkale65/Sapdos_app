import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/atoms/custom_profile_intro_card.dart';
import 'package:sapdos_app/presentation/atoms/custom_menu.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class CustomDashboard extends StatefulWidget {
  final String introTitle;
  final String introSubtitle;
  final String introImagePath;
  final List<Widget> belowCardWidgets;

  const CustomDashboard({
    Key? key,
    required this.introTitle,
    required this.introSubtitle,
    required this.introImagePath,
    required this.belowCardWidgets,
  }) : super(key: key);

  @override
  State<CustomDashboard> createState() => _CustomDashboardState();
}

class _CustomDashboardState extends State<CustomDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "SAPDOS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    fontFamily: AppFonts.primary,
                    color: AppColors.secondary,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CustomeMenuContainer(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(26.0),
            
                child: Column(
                  children: [
                    CustomIntroCard(
                      title: widget.introTitle,
                      subtitle: widget.introSubtitle,
                      imagePath: widget.introImagePath,
                    ),
                    SizedBox(height: 20),
                    for (var widget in widget.belowCardWidgets) widget,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
