import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class CustomOutlineTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData iconData;
  final Color iconColor;
  final Color textColor;

  const CustomOutlineTile({
    Key? key,
    required this.text,
    required this.onTap,
    required this.iconData,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.83,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: textColor),
              ),
            ),
            ClipOval(
              child: Material(
                color: AppColors.fourth,
                child: InkWell(
                  splashColor: Colors.white,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(
                      iconData,
                      color: iconColor,
                    ),
                  ),
                  onTap: onTap,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
