import 'package:flutter/material.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class CustomIntroCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const CustomIntroCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: AppFonts.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(imagePath),
          ),
        ],
      ),
    );
  }
}
