import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleBar extends StatelessWidget {
  final String title;
  const TitleBar({
    Key key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 32),
        Container(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            'lib/Presentation/Images/arrow.svg',
            semanticsLabel: 'Arrow',
            color: AppColors.cDarkGrey,
          ),
        ),
        SizedBox(width: 10.0),
        Text(
          this.title,
          style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey),
        ),
      ],
    );
  }
}
