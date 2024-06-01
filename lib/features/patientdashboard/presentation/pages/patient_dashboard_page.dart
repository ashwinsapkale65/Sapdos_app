import 'package:flutter/material.dart';
import 'package:sapdos_app/core/screens/custom_dashboard.dart';
import 'package:sapdos_app/features/patientdashboard/presentation/widgets/doctor_cards.dart';
import 'package:sapdos_app/presentation/atoms/custom_doctor_card.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class DoctorInfo {
  final String imageUrl;
  final String name;
  final String subtitle;

  DoctorInfo({
    required this.imageUrl,
    required this.name,
    required this.subtitle,
  });
}

List<DoctorInfo> doctorsInfo = [
  DoctorInfo(
    imageUrl: 'assets/images/4.png',
    name: 'Dr. John Doe',
    subtitle: 'Cardiologist',
  ),
  DoctorInfo(
    imageUrl: 'assets/images/4.png',
    name: 'Dr. Jane Smith',
    subtitle: 'Neurologist',
  ),
  DoctorInfo(
    imageUrl: 'assets/images/5.png',
    name: 'Dr. Jane Smith',
    subtitle: 'Neurologist',
  ),
  DoctorInfo(
    imageUrl: 'assets/images/5.png',
    name: 'Dr. Jane Smith',
    subtitle: 'Neurologist',
  ),
  DoctorInfo(
    imageUrl: 'assets/images/9.png',
    name: 'Dr. Jane Smith',
    subtitle: 'Neurologist',
  ),
  DoctorInfo(
    imageUrl: 'assets/images/9.png',
    name: 'Dr. Jane Smith',
    subtitle: 'Neurologist',
  ),
];

class PatientDashboardPage extends StatefulWidget {
  const PatientDashboardPage({super.key});

  @override
  State<PatientDashboardPage> createState() => _PatientDashboardPageState();
}

class _PatientDashboardPageState extends State<PatientDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return CustomDashboard(
        introTitle: "Hello!",
        introSubtitle: "Satish",
        introImagePath: "assets/images/4.png",
        belowCardWidgets: [
          SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Doctor's List",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.sort,
                        color: AppColors.primary,
                      ),
                    ),
                  ])),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.62,
            child: ProfileCardsGrid(),
          ),
        ]);
  }
}
