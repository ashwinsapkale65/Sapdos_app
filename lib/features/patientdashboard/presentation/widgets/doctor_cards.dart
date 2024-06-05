import 'package:flutter/material.dart';
import 'package:sapdos_app/features/doctorinfo/presentation/pages/doctor_info_screen.dart';
import 'package:sapdos_app/features/patientdashboard/domain/entities/user_doctor_entity.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class ProfileCardsGrid extends StatelessWidget {
  final List<DoctorsList> userDoctors;

  ProfileCardsGrid({required this.userDoctors});

  @override
  Widget build(BuildContext context) {
    print(userDoctors);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 3,
      ),
      itemCount: userDoctors.length,
      itemBuilder: (context, index) {
        return ProfileCard(
          image: userDoctors[index].doctorImage!,
          title: userDoctors[index]!.doctorName!,
          subtitle: userDoctors[index].specialization!,
          // Assuming rating is not fetched from bloc, provide a default value
          rating: 0,
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double rating;

  ProfileCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorInfoPage(
              image: image,
              name: title,
              specialization: subtitle,
              rating: rating,
            ),
          ),
        );
      },
      child: Card(
        color: AppColors.fourth,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 50,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < rating
                              ? Icons.star
                              : Icons.star_border_outlined,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
