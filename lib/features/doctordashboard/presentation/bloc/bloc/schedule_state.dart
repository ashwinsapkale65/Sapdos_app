part of 'schedule_bloc.dart';

class ScheduleState extends Equatable {
  final List<ScheduleItemModel> schedule;
  final int completedCount;
  final int pendingCount;

  const ScheduleState({
    required this.schedule,
    required this.completedCount,
    required this.pendingCount,
  });

  @override
  List<Object?> get props => [schedule, completedCount, pendingCount];
}

class ScheduleLoading extends ScheduleState {
  ScheduleLoading() : super(schedule: [], completedCount: 0, pendingCount: 0);
}

class ScheduleLoaded extends ScheduleState {
  const ScheduleLoaded(
    List<ScheduleItemModel> schedule, {
    required int completedCount,
    required int pendingCount,
  }) : super(
            schedule: schedule,
            completedCount: completedCount,
            pendingCount: pendingCount);
}

class ScheduleError extends ScheduleState {
  final String errorMessage;

  const ScheduleError(this.errorMessage)
      : super(
          schedule: const [],
          completedCount: 0,
          pendingCount: 0,
        );

  @override
  List<Object?> get props => [errorMessage];
}
