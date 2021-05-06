import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final MaterialColor color;

  const Answer({Key key, this.answer, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      // color: Colors.red,
      child: Row(
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: AppColors.cDarkGrey[100],
            ),
          ),
          SizedBox(width: 8),
          Text(
            this.answer,
            style: AppFonts.appText,
          ),
        ],
      ),
    );
  }
}
