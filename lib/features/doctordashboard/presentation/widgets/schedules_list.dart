// schedule_list_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/features/doctordashboard/presentation/bloc/bloc/schedule_bloc.dart';
import 'package:sapdos_app/presentation/atoms/custom_schedule_list.dart';

class ScheduleListWidget extends StatelessWidget {
  const ScheduleListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        if (state is ScheduleLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ScheduleLoaded) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: state.schedule.length,
              itemBuilder: (context, index) {
                final item = state.schedule[index];
                return CustomScheduleItem(scheduleItem: item);
              },
            ),
          );
        } else if (state is ScheduleError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Container();
        }
      },
    );
  }
}
