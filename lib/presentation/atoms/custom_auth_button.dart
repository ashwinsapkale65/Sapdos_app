import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class CustomButton extends StatelessWidget {
  final bool isTrue;
  final String text;
  final VoidCallback? onPressed;
  final VoidCallback? onTap;
  double width;

  CustomButton({
    Key? key,
    required this.isTrue,
    required this.text,
    this.onPressed,
    this.onTap,
    this.width = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: 50.0,
      child: GestureDetector(
        onTap: onTap,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                isTrue ? AppColors.primary : Colors.white),
            side: isTrue
                ? null
                : MaterialStateProperty.all(
                    BorderSide(color: AppColors.primary)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.secondary,
                color: isTrue ? Colors.white : AppColors.primary),
          ),
        ),
      ),
    );
  }
}
