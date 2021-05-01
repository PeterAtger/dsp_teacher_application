part of 'notificationtimes_cubit.dart';

@immutable
class NotificationTimesState {
  final TimeOfDay fromTime;
  final TimeOfDay toTime;

  NotificationTimesState(this.fromTime, this.toTime);
}
