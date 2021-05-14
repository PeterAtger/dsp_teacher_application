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
    this.isGrey = true,
  }) : super(key: key);

  final ButtonStyle outlineButtonStyle;
  final String img;
  final Size size;
  final String txt;
  final bool isGrey;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: outlineButtonStyle,
      onPressed: () async {
        await Future.delayed(Duration(milliseconds: 250), () {
          Navigator.of(context)
              .pushNamed('/MainScreen/Questions', arguments: txt);
        });
      },
      child: Column(children: [
        SvgPicture.asset(img, height: 56),
        SizedBox(
          height: 8,
        ),
        Text(txt,
            style: AppFonts.appText.copyWith(
              color: this.isGrey ? AppColors.cDarkGrey : AppColors.cWhite,
            ))
      ]),
    );
  }
}
