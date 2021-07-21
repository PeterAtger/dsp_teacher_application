import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    Key key,
    @required this.size,
    @required this.onButtonPress,
    this.text,
    this.icon,
    this.iconcolor,
    this.textcolor,
    this.buttoncolor,
    this.frame,
  }) : super(key: key);

  final Size size;
  final String text;
  final String icon;
  final MaterialColor iconcolor;
  final MaterialColor textcolor;
  final MaterialColor buttoncolor;
  final MaterialColor frame;
  final Function onButtonPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: ElevatedButton(
        onPressed: onButtonPress,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              'lib/Presentation/Images/$icon.svg',
              width: 16,
              height: 16,
            ),
            Expanded(
              child: AutoSizeText(
                text,
                textAlign: TextAlign.center,
                maxLines: 1,
                minFontSize: 1,
                maxFontSize: 15,
                style: AppFonts.button.copyWith(
                  color: textcolor,
                ),
              ),
            ),
          ]),
        ),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(AppColors.cDarkGrey[500]),
          backgroundColor: MaterialStateProperty.all(buttoncolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }
}
