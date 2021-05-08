import 'package:dsp_teacher_application/Logic/main/manipulateQ_state.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ManipulateQusetionCubit extends Cubit<ManipulateState> {
  ManipulateQusetionCubit() : super(ManipulateState(question: []));
  List<List<String>> list = [
    ['sara', 'was', 'eating', 'apple', 'she', 'is', 'funny'],
    ['Doba', 'is', 'sleeping', 'early', 'she', 'is', 'cute'],
    ['tata', 'has', 'big', 'book', 'he', 'is', 'bad']
  ];
  List<List<Text>> scrollData = [];
  List<List<String>> words = [];
  List<Text> choice = [];
  void onTap(String text, int index, int sentencelength) {
    if (index * sentencelength + sentencelength - 1 > list.length) {
      words.addAll([
        list[0].sublist(index * sentencelength),
        list[1].sublist(index * sentencelength),
        list[2].sublist(index * sentencelength)
      ]);
    } else {
      words.addAll([
        list[0].sublist(
            index * sentencelength, index * sentencelength + sentencelength),
        list[1].sublist(
            index * sentencelength, index * sentencelength + sentencelength),
        list[2].sublist(
            index * sentencelength, index * sentencelength + sentencelength)
      ]);
    }
    // for (var choice in words) {
    //   List<Text> choi = choice.map((st) {
    //     return (Text(
    //       st,
    //       style: AppFonts.smallButtonText,
    //     ));
    //   }).toList();
    //   scrollData.add(choi);
    // }
    emit(ManipulateState(question: words));
  }
}
