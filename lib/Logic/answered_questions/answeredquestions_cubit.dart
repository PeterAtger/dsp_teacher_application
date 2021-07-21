import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/repositries/answered_questions/answered_questions.dart';
import 'package:dsp_teacher_application/Presentation/Pages/questions/local_components/Answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'answeredquestions_state.dart';

List<String> answers = [];

class AnsweredQuestionsCubit extends Cubit<AnsweredQuestionsState> {
  AnsweredQuestionsCubit() : super(AnsweredQuestionsState(null));
  void goToAnsweredQuestions() async {
    answers = await AnsweredQuestionsData.getAnswers();
    List<Answer> templist = [];
    for (int i = 0; i < answers.length; i++) {
      templist.add(Answer(
        answer: answers[i],
        isGreen: i % 2 == 0,
      ));
    }
    emit(AnsweredQuestionsState(templist));
  }
}
