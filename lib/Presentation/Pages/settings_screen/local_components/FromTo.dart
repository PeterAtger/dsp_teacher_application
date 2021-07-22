import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FromToPanda extends StatelessWidget {
  const FromToPanda({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.From.tr(),
            style: AppFonts.bodyText1.copyWith(color: AppColors.cGreen),
          ),
          Text(
            LocaleKeys.To.tr(),
            style: AppFonts.bodyText1.copyWith(color: AppColors.cGreen),
          ),
        ],
      ),
    );
  }
}
