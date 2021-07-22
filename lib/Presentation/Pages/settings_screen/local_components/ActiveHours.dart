import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class ActiveHours extends StatelessWidget {
  const ActiveHours({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 48),
        Text(
          LocaleKeys.ActiveHours.tr(),
          style: AppFonts.heading6.copyWith(color: AppColors.cDarkGrey),
        ),
        SizedBox(width: 70),
        Container(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            'lib/Presentation/Images/panda.svg',
            semanticsLabel: 'panda',
          ),
        ),
      ],
    );
  }
}
