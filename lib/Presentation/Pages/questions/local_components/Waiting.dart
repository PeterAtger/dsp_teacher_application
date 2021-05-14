import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/global_components/GradientLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Waiting extends StatelessWidget {
  final String question;
  final Level level;
  final bool isUrgent;

  const Waiting({
    Key key,
    @required this.size,
    this.question,
    this.level,
    this.isUrgent,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.cWhite,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2, blurRadius: 4, color: AppColors.cLightGrey)
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _iconChooser(this.level),
                    SizedBox(width: 8),
                    _textChooser(this.level),
                  ],
                ),
                this.isUrgent
                    ? Row(
                        children: [
                          Text('Urgent'),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: AppColors.cGreen,
                                shape: BoxShape.circle),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: GradientLine(size: size),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Text(this.question),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.cPurple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Text _textChooser(Level level) {
  if (level == Level.Primary) {
    return Text('Primary');
  } else if (level == Level.Preparatory) {
    return Text('Preparatory');
  } else if (level == Level.Secondary) {
    return Text('Secondary');
  }
  return Text('Error');
}

SvgPicture _iconChooser(Level level) {
  if (level == Level.Primary) {
    return SvgPicture.asset('lib/Presentation/Images/boy.svg');
  } else if (level == Level.Preparatory) {
    return SvgPicture.asset('lib/Presentation/Images/girl.svg');
  } else if (level == Level.Secondary) {
    return SvgPicture.asset(' lib/Presentation/Images/secondaryboy.svg');
  }
  return SvgPicture.asset('lib/Presentation/Images/error.svg');
}
