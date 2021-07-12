import 'package:dsp_teacher_application/Logic/notification_settings/notificationsettings_cubit.dart';
import 'package:dsp_teacher_application/Logic/notification_settings/notificationtimes_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/ActiveHours.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/FromTo.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/SettingsToggle.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/TeacherTimeSettings.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/translations/lokale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      //Body
      body: MultiBlocProvider(
        providers: [
          BlocProvider<NotificationSettingsCubit>(
              create: (context) => NotificationSettingsCubit()),
          BlocProvider<NotificationTimesCubit>(
              create: (context) => NotificationTimesCubit())
        ],
        child: Stack(
          children: [
            ArabicImage(
              top: -size.height / 3,
              right: -size.height / 3,
              size: size.height / 1.5,
              blendMode: BlendMode.srcATop,
              opacity: 0.1,
            ),
            BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: 72),
                    TitleBar(
                      title: LocaleKeys.Notifications.tr(),
                    ),
                    SizedBox(height: 56),
                    SettingsToggle(
                      size: size,
                      spacing: 40,
                      toggleText: LocaleKeys.PushNotifications.tr(),
                      onChanged: (value) {
                        context
                            .read<NotificationSettingsCubit>()
                            .togglePushNotifications(state);
                      },
                      active: state.pushNotifications,
                    ),
                    SizedBox(height: 32),
                    GradientLine(size: size),
                    SizedBox(height: 8),
                    SettingsToggle(
                      spacing: 80,
                      toggleText: LocaleKeys.NewQueries.tr(),
                      size: size,
                      onChanged: (value) {
                        context
                            .read<NotificationSettingsCubit>()
                            .toggleNewQuery(state);
                      },
                      active: state.newQuery,
                    ),
                    SizedBox(height: 8),
                    SettingsToggle(
                      size: size,
                      spacing: 80,
                      toggleText: LocaleKeys.NewUpdates.tr(),
                      onChanged: (value) {
                        context
                            .read<NotificationSettingsCubit>()
                            .toggleNewUpdates(state);
                      },
                      active: state.newUpdates,
                    ),
                    SizedBox(height: 40),
                    ActiveHours(),
                    SizedBox(height: 32),
                    GradientLine(size: size),
                    SizedBox(height: 16),
                    FromToPanda(),
                    SizedBox(height: 8),
                    BlocBuilder<NotificationTimesCubit, NotificationTimesState>(
                      builder: (context, state) {
                        return TeacherTimeSettings(
                          state: state,
                          fromTimeTab: () {
                            context
                                .read<NotificationTimesCubit>()
                                .selectFromTime(context, state);
                          },
                          toTimeTab: () {
                            context
                                .read<NotificationTimesCubit>()
                                .selectToTime(context, state);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Text(LocaleKeys.TimeWhere.tr(),
                          style: AppFonts.captionText
                              .copyWith(color: AppColors.cLightGrey)),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
