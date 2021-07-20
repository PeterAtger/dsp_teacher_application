import 'package:dsp_teacher_application/Data/repositries/Selected_Question/selected_question.dart';
import 'package:dsp_teacher_application/Logic/main/check_cubit_matrix.dart';
import 'package:dsp_teacher_application/Logic/main/manipulateQ_state.dart';
import 'package:dsp_teacher_application/Logic/main/transpose.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ManipulateQusetionCubit extends Cubit<ManipulateState> {
  ManipulateQusetionCubit()
      : super(ManipulateState(question: [
          [Center(child: Text(''))],
          [Center(child: Text(''))],
          [Center(child: Text(''))]
        ]));

  List<List<Widget>> scrollData;
  List<List<String>> words;
  List<Widget> choice;

  void onTap(String text, int index, int sentencelength) {
    List<List<String>> list = SelectedQuestion.getListFromSelectedQuestion();
    scrollData = [];
    words = [];
    choice = [];
    list[0].remove('.');
    words.addAll(check(list, sentencelength)
        .map((e) => e.sublist(
            index * sentencelength, index * sentencelength + sentencelength))
        .toList());

    for (var choice in words) {
      List<Widget> choi = choice.map((st) {
        return Center(
          child: (Text(
            st,
            style: AppFonts.bodyText1.copyWith(color: AppColors.cDarkGrey),
          )),
        );
      }).toList();
      scrollData.add(choi);
    }
    emit(ManipulateState(question: transpose(scrollData)));
  }
}
