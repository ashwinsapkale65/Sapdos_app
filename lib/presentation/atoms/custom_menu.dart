import 'package:flutter/material.dart';
import 'package:sapdos_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class CustomeMenuContainer extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(icon: Icons.category, text: 'Categories'),
    MenuItem(icon: Icons.calendar_today, text: 'Appointment'),
    MenuItem(icon: Icons.chat, text: 'Chat'),
    MenuItem(icon: Icons.settings, text: 'Settings'),
    MenuItem(icon: Icons.exit_to_app, text: 'Logout'),
  ];

  CustomeMenuContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: menuItems
            .map((item) => GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              item.icon,
                              color: AppColors.secondary,
                            ),
                            SizedBox(width: 30),
                            Text(
                              item.text,
                              style: TextStyle(
                                fontSize: 25.0,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String text;

  MenuItem({required this.icon, required this.text});
}
