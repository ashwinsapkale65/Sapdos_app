import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/features/doctordashboard/presentation/bloc/bloc/schedule_bloc.dart';
import 'package:sapdos_app/presentation/atoms/custom_appontment_progress.dart';

import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class AppointmentStatusWidget extends StatelessWidget {
  const AppointmentStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        if (state is ScheduleLoaded) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.6,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: MediaQuery.of(context).size.height * 0.22,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Appointment",
                  style: TextStyle(
                    color: AppColors.third,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    AppointmentProgressItem(
                      title: "Completed Appointments",
                      total: state.schedule.length,
                      progress: state.completedCount,
                    ),
                    AppointmentProgressItem(
                      title: "Pending Appointments",
                      total: state.schedule.length,
                      progress: state.pendingCount,
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
