import 'package:dsp_teacher_application/Data/Models/answers.dart';
import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Data/repositries/Selected_Question/selected_question.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/global_components/GradientLine.dart';
import 'package:dsp_teacher_application/Presentation/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionCard extends StatelessWidget {
  final int id;
  final String question;
  final Level level;
  final bool isUrgent;
  final Answers answers;

  const QuestionCard({
    Key key,
    this.question,
    this.answers,
    this.level,
    this.isUrgent,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Main Container
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                spreadRadius: 4,
                blurRadius: 4,
                color: AppColors.cLightGrey,
                offset: Offset(0, 4))
          ],
        ),

        //Clickabble Item
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.cWhite,
          child: InkWell(
            onTap: () {
              SelectedQuestion.setSelectedQuestion(Question(
                  id: this.id,
                  isUrgent: this.isUrgent,
                  question: this.question,
                  answers: this.answers));
              Navigator.pushNamed(
                  context, '/MainScreen/Questions/QuestionScreen',
                  arguments: Question(
                      id: this.id,
                      question: this.question,
                      isUrgent: this.isUrgent,
                      answers: this.answers));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              // Column of 2 Rows and a seperator
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
                                // Text('Urgent'),
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
                          child: Text(this.question, style: AppFonts.bodyText1),
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
          ),
        ),
      ),
    );
  }
}

Text _textChooser(Level level) {
  if (level == Level.Primary) {
    return Text(LocaleKeys.Primary.tr(),
        style: AppFonts.bodyText1.copyWith(fontWeight: FontWeight.w700));
  } else if (level == Level.Preparatory) {
    return Text(LocaleKeys.Preparatory.tr(),
        style: AppFonts.bodyText1.copyWith(fontWeight: FontWeight.w700));
  } else if (level == Level.Secondary) {
    return Text(LocaleKeys.Secondary.tr(),
        style: AppFonts.bodyText1.copyWith(fontWeight: FontWeight.w700));
  } else if (level == Level.Enthusiast) {
    return Text(LocaleKeys.Enthusiast.tr(),
        style: AppFonts.bodyText1.copyWith(fontWeight: FontWeight.w700));
  }
  return Text('Error');
}

SvgPicture _iconChooser(Level level) {
  if (level == Level.Primary) {
    return SvgPicture.asset('lib/Presentation/Images/boy.svg', height: 24);
  } else if (level == Level.Preparatory) {
    return SvgPicture.asset('lib/Presentation/Images/girl.svg', height: 24);
  } else if (level == Level.Secondary) {
    return SvgPicture.asset('lib/Presentation/Images/secondaryboy.svg',
        height: 24);
  } else if (level == Level.Enthusiast) {
    return SvgPicture.asset('lib/Presentation/Images/enthusiast2.svg',
        height: 24);
  }
  return SvgPicture.asset('lib/Presentation/Images/error.svg', height: 24);
}
