import 'package:dsp_teacher_application/Logic/notification_settings/notificationtimes_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class TeacherTimeSettings extends StatelessWidget {
  final Function fromTimeTab;
  final Function toTimeTab;
  final NotificationTimesState state;

  const TeacherTimeSettings({
    Key key,
    this.fromTimeTab,
    this.toTimeTab,
    this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: fromTimeTab,
            child: Text(
              "${state.fromTime.format(context)}",
              style: AppFonts.bodyText1.copyWith(color: AppColors.cDarkGrey),
            ),
          ),
          InkWell(
            onTap: toTimeTab,
            child: Text(
              "${state.toTime.format(context)}",
              style: AppFonts.bodyText1.copyWith(color: AppColors.cDarkGrey),
            ),
          ),
        ],
      ),
    );
  }
}
