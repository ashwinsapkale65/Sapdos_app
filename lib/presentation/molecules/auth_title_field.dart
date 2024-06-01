import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class AuthTitleField extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthTitleField({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title\n",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sans',
              color: AppColors.primary,
            ),
          ),
          TextSpan(
            text: subtitle,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Sans',
              color: Color(0xFF707070),
            ),
          ),
        ],
      ),
    );
  }
}
