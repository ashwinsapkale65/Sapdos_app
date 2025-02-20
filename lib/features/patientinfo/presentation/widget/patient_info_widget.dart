import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/atoms/info_image.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class PatientInfoWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final int age;
  final String issueDescription;

  const PatientInfoWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.age,
    required this.issueDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageContainer(
            imagePath: imagePath,
            width: 200,
            height: 200,
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    age.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Issue Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sans',
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  issueDescription,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
