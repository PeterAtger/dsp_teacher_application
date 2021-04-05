import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';

class MainScreenTableItem extends StatelessWidget {
  const MainScreenTableItem({
    Key key,
    @required this.outlineButtonStyle,
    @required this.img,
    @required this.size,
    @required this.txt,
  }) : super(key: key);

  final ButtonStyle outlineButtonStyle;
  final String img;
  final Size size;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: outlineButtonStyle,
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/QuestionsList',
            arguments: txt);
      },
      child: Column(children: [
        SvgPicture.asset(img, height: 56),
        Text(txt,
            style: AppFonts.appText.copyWith(
              color: AppColors.cDarkGrey,
            ))
      ]),
    );
  }
}
