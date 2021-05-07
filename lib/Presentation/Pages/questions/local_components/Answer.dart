import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final bool isGreen;

  const Answer({Key key, this.answer, this.isGreen = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      color: this.isGreen == true ? AppColors.cGreen[100] : Colors.transparent,
      child: Row(
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cDarkGrey[500],
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: size.width - 80,
            child: Text(
              this.answer,
              style: AppFonts.appText,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
