import 'package:flutter/material.dart';
import 'package:sapdos_app/core/screens/custom_dashboard.dart';
import 'package:sapdos_app/features/doctordashboard/presentation/widgets/apponitment_status.dart';
import 'package:sapdos_app/features/doctordashboard/presentation/widgets/date_picker_widget.dart';
import 'package:sapdos_app/features/doctordashboard/presentation/widgets/schedules_list.dart';

class DoctorDashboardPage extends StatefulWidget {
  const DoctorDashboardPage({super.key});

  @override
  State<DoctorDashboardPage> createState() => _DoctorDashboardPageState();
}

class _DoctorDashboardPageState extends State<DoctorDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDashboard(
          introTitle: "Hello!",
          introSubtitle: "Dr.Amol",
          introImagePath: "assets/images/5.png",
          belowCardWidgets: [
            AppointmentStatusWidget(),
            DatpickerContainerWidget(),
            ScheduleListWidget()
          ]),
    );
  }
}
