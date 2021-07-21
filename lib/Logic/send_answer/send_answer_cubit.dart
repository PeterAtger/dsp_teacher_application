import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/repositries/answered_questions/answered_questions.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_cubit.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'send_answer_state.dart';

class SendAnswerCubit extends Cubit<SendAnswerState> {
  SendAnswerCubit() : super(SendAnswerState(null));
  static String teacherAnswer;
  static int method;

  void manualChangeAnswer(String answer) {
    teacherAnswer = answer;
    print(teacherAnswer);
  }

  void autoChangeAnswer() {
    teacherAnswer = ChocenChoicCubit().state.answer.join(' ');
  }

  void changeMethod(int value) {
    method = value;
    print(method);
  }

  Future<void> postAnswer(
    int sentenceID,
  ) async {
    final url = Uri.parse('http://34.132.143.59:8000/sentences/$sentenceID/');
    final headers = {
      "Content-type": "application/json",
      "authorization": "Token ${Tokens.signInToken}"
    };
    if (method == 1) autoChangeAnswer();
    final json = jsonEncode({"diacritized": teacherAnswer});

    final response = await put(url, headers: headers, body: json);

    int code = response.statusCode;
    if (code < 299) {
      AnsweredQuestionsData.addAnswer(teacherAnswer);
    }

    emit(SendAnswerState(code));
  }
}
