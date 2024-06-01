import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sapdos_app/features/doctordashboard/model/patient_model.dart';
import 'package:sapdos_app/features/patientinfo/presentation/bloc/custom_expansion_tile_boc.dart';
import 'package:sapdos_app/features/patientinfo/presentation/widget/custom_expansion_tile.dart';
import 'package:sapdos_app/features/patientinfo/presentation/widget/patient_info_widget.dart';
import 'package:sapdos_app/presentation/atoms/custom_outline_tile.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class PatientInfoPage extends StatefulWidget {
  final ScheduleItemModel scheduleItem;
  const PatientInfoPage({super.key, required this.scheduleItem});

  @override
  State<PatientInfoPage> createState() => _PatienScreenPageState();
}

class _PatienScreenPageState extends State<PatientInfoPage> {
  Color change = AppColors.primary;
  @override
  Widget build(BuildContext context) {
    CustomExpansionTileBloc _expansionTileBloc1 = CustomExpansionTileBloc();
    CustomExpansionTileBloc _expansionTileBloc2 = CustomExpansionTileBloc();
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              PatientInfoWidget(
                  imagePath: 'assets/images/patient.png',
                  name: widget.scheduleItem.patientName,
                  age: widget.scheduleItem.age,
                  issueDescription:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              SizedBox(height: 10),
              CustomExpansionTile(
                bloc: _expansionTileBloc1,
                title: Text(
                  "Patient History",
                  style: TextStyle(
                      color: AppColors.secondary,
                      fontFamily: 'Sans',
                      fontSize: 20),
                ),
                icon: Icon(
                  Icons.timer,
                  color: AppColors.secondary,
                  size: 20,
                ),
                content: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomOutlineTile(
                    text: "Blood Report",
                    onTap: () {},
                    iconColor: AppColors.primary,
                    iconData: Icons.remove_red_eye,
                    textColor: AppColors.primary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomOutlineTile(
                    text: "CT Scan Report",
                    onTap: () {},
                    iconColor: AppColors.primary,
                    iconData: Icons.remove_red_eye,
                    textColor: AppColors.primary,
                  ),
                ]),
              ),
              SizedBox(height: 20),
              CustomExpansionTile(
                  bloc: _expansionTileBloc2,
                  title: Text(
                    "Prescription",
                    style: TextStyle(
                        color: AppColors.secondary,
                        fontFamily: 'Sans',
                        fontSize: 20),
                  ),
                  icon: Icon(
                    Icons.medical_information,
                    color: AppColors.secondary,
                    size: 20,
                  ),
                  content: Container(
                    child: Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomOutlineTile(
                        text: "26 March 2022",
                        onTap: () {},
                        iconColor: AppColors.primary,
                        iconData: Icons.remove_red_eye,
                        textColor: AppColors.primary,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomOutlineTile(
                        text: "13 April 2022",
                        onTap: () {},
                        iconColor: AppColors.primary,
                        iconData: Icons.remove_red_eye,
                        textColor: AppColors.primary,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomOutlineTile(
                        text: "Add New",
                        onTap: () {},
                        iconColor: AppColors.primary,
                        iconData: Icons.add,
                        textColor: Colors.grey,
                      ),
                    ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
