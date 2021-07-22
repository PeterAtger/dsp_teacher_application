import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton(
      {Key key,
      @required this.size,
      @required this.text,
      @required this.green,
      this.onPress})
      : super(key: key);

  final Size size;
  final String text;
  final bool green;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: size.width * 0.8,
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(AppColors.cDarkGrey[50]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            backgroundColor: MaterialStateProperty.all(
                green ? AppColors.cGreen : AppColors.cLightGrey)),
        onPressed: this.onPress,
        child: Center(
          child: Text(
            this.text,
            style: AppFonts.button
                .copyWith(color: green ? AppColors.cWhite : AppColors.cGreen),
          ),
        ),
      ),
    );
  }
}
