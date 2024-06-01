import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class CustomImageContainer extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const CustomImageContainer({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors
            .cardcolor, 
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.cardcolor,
          width: 18,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
