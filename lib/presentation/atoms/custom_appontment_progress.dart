import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class AppointmentProgressItem extends StatelessWidget {
  final int progress;
  final int total;
  final String title;

  const AppointmentProgressItem({
    Key? key,
    required this.progress,
    required this.total,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardcolor,
      ),
      width: 130,
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    value: progress / total,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.secondary),
                    strokeWidth: 4,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$progress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' / ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '$total ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}
