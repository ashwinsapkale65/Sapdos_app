import 'package:flutter/material.dart';
import 'package:sapdos_app/features/bookappointment/presentation/pages/book_appointment_page.dart';
import 'package:sapdos_app/features/doctorinfo/presentation/widgets/doctor_info_widget.dart';
import 'package:sapdos_app/features/doctorinfo/presentation/widgets/timing_slots_grid.dart';
import 'package:sapdos_app/presentation/atoms/custom_auth_button.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class DoctorInfoPage extends StatefulWidget {
  final String image;
  final String name;
  final String specialization;
  final double rating;
  const DoctorInfoPage(
      {super.key,
      required this.image,
      required this.name,
      required this.specialization,
      required this.rating});

  @override
  State<DoctorInfoPage> createState() => _DoctorInfoPageState();
}

class _DoctorInfoPageState extends State<DoctorInfoPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.specialization);
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Doctorinfowidget(
                  imagePath: widget.image,
                  name: widget.name,
                  specilization: widget.specialization,
                  rating: widget.rating as int,
                  issueDescription:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width * 0.83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: AppColors.secondary,
                      size: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "Available Slots",
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans'),
                    )),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.secondary,
                      size: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TimeSlotsGrid()),
              SizedBox(height: 20),
              CustomButton(
                isTrue: true,
                text: "Book Appointment",
                width: 0.2,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookAppointmentPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
