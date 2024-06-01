import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/services.dart';
import 'package:sapdos_app/features/doctordashboard/model/patient_model.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleLoading()) {
    on<LoadSchedule>(_onLoadSchedule);
  }

  Future<void> _onLoadSchedule(
    LoadSchedule event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(ScheduleLoading());
    try {
      final String response =
          await rootBundle.loadString('assets/images/appointments.json');
      final List<dynamic> data = json.decode(response);
      final List<ScheduleItemModel> schedule =
          data.map((item) => ScheduleItemModel.fromJson(item)).toList();

      int completedCount = 0;
      int pendingCount = 0;
      for (var item in schedule) {
        if (item.isCompleted) {
          completedCount++;
        } else if (item.isPending) {
          pendingCount++;
        }
      }

      emit(ScheduleLoaded(
        schedule,
        completedCount: completedCount,
        pendingCount: pendingCount,
      ));
    } catch (e) {
      emit(const ScheduleError("Failed to load schedule"));
    }
  }
}
