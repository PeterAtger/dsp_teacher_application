import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'notificationsettings_state.dart';

class NotificationSettingsCubit
    extends HydratedCubit<NotificationSettingsState> {
  NotificationSettingsCubit()
      : super(NotificationSettingsState(
            pushNotifications: true, newUpdates: true, newQuery: true));

  void togglePushNotifications(NotificationSettingsState state) {
    state.pushNotifications == true
        ? emit(NotificationSettingsState(
            pushNotifications: false, newUpdates: false, newQuery: false))
        : emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: state.newUpdates,
            newQuery: state.newQuery));
  }

  void toggleNewUpdates(NotificationSettingsState state) {
    state.newUpdates == true
        ? emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: false,
            newQuery: state.newQuery))
        : emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: true,
            newQuery: state.newQuery));
  }

  void toggleNewQuery(NotificationSettingsState state) {
    state.newQuery == true
        ? emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: state.newUpdates,
            newQuery: false))
        : emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: state.newUpdates,
            newQuery: true));
  }

  // Saving States
  @override
  NotificationSettingsState fromJson(Map<String, dynamic> json) {
    return NotificationSettingsState(
        pushNotifications: json['pushNotifications'],
        newQuery: json['newQuery'],
        newUpdates: json['newUpdates']);
  }

  @override
  Map<String, dynamic> toJson(NotificationSettingsState state) {
    return {
      'pushNotifications': state.pushNotifications,
      'newQuery': state.newQuery,
      'newUpdates': state.newUpdates
    };
  }
}
