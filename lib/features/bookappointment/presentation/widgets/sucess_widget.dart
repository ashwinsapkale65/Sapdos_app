import 'package:flutter/material.dart';
import 'package:sapdos_app/features/patientdashboard/presentation/pages/patient_dashboard_page.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class SucessWidget extends StatelessWidget {
  const SucessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
          ),
          width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.height * 0.35,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: AppColors.secondary,
                size: 50,
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Your Booking \nis Confirmed',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientDashboardPage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondary,
                  ),
                  child: Center(
                    child: Text(
                      'Okay',
                      style: TextStyle(
                          fontFamily: AppFonts.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: AppColors.primary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
