import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'notificationtimes_state.dart';

class NotificationTimesCubit extends Cubit<NotificationTimesState> {
  NotificationTimesCubit()
      : super(NotificationTimesState(
            TimeOfDay(hour: 18, minute: 00), TimeOfDay(hour: 19, minute: 00)));

  Future<TimeOfDay> cubitShowTimePicker(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  Future<void> selectFromTime(
      BuildContext context, NotificationTimesState state) async {
    await cubitShowTimePicker(context).then((value) {
      value == null
          ? emit(NotificationTimesState(state.fromTime, state.toTime))
          : emit(NotificationTimesState(value, state.toTime));
    });
  }

  Future<void> selectToTime(
      BuildContext context, NotificationTimesState state) async {
    await cubitShowTimePicker(context).then((value) {
      value == null
          ? emit(NotificationTimesState(state.fromTime, state.toTime))
          : emit(NotificationTimesState(state.fromTime, value));
    });
  }
}
