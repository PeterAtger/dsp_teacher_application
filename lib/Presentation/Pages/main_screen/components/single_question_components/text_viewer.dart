import 'package:dsp_teacher_application/Logic/main/ManipulateQ_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/single_question_components/selectable_text.dart';

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
    return Container(
        height: h * 0.33,
        width: w,
        decoration: BoxDecoration(
          color: AppColors.cGreen[100],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: WordSelectableText(
            onWordTapped: context.read<ManipulateQusetionCubit>().onTap,
            text: selectedQuestion,
            highlightColor: Colors.yellow[300],
            style: AppFonts.appText,
            sentenceLength: 2,
          ),
        ));
  }
}
