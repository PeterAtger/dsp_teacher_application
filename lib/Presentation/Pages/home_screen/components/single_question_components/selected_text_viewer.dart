import 'package:dsp_teacher_application/Logic/main/ManipulateQ_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/selectable_text.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextViewer extends StatelessWidget {
  const TextViewer({
    Key key,
    this.selectedQuestion,
  }) : super(key: key);

  final List<String> selectedQuestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        child: WordSelectableText(
          onWordTapped: context.read<ManipulateQusetionCubit>().onTap,
          text: this.selectedQuestion,
          highlightColor: Colors.yellow[200],
          style: AppFonts.captionText,
          sentenceLength: 3,
        ),
      ),
    );
  }
}
