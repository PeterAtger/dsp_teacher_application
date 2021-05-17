import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/selectable_text.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class TextViewer extends StatelessWidget {
  const TextViewer({
    Key key,
    @required this.h,
    @required this.w,
    this.selectedQuestion,
  }) : super(key: key);

  final double h;
  final double w;
  final String selectedQuestion;

  @override
  Widget build(BuildContext context) {
    print(this.selectedQuestion);
    return Container(
        height: h * 0.33,
        width: w,
        decoration: BoxDecoration(
          color: AppColors.cGreen[100],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: WordSelectableText(
            // onWordTapped: context.read<ManipulateQusetionCubit>().onTap,
            text: this.selectedQuestion,
            highlightColor: Colors.yellow[200],
            style: AppFonts.bodyText1,
            sentenceLength: 5,
          ),
        ));
  }
}
