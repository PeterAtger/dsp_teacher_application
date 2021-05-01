part of 'notificationsettings_cubit.dart';

@immutable
class NotificationSettingsState {
  final bool pushNotifications;
  final bool newQuery;
  final bool newUpdates;

  NotificationSettingsState({
    this.pushNotifications,
    this.newQuery,
    this.newUpdates,
  });
}
