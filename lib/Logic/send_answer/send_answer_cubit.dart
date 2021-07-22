import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/repositries/answered_questions/answered_questions.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_cubit.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'send_answer_state.dart';

class SendAnswerCubit extends Cubit<SendAnswerState> {
  SendAnswerCubit() : super(SendAnswerState(400));
  static String teacherAnswer;
  static int method = 0;

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

    if (method == 1 || teacherAnswer == null) autoChangeAnswer();
    final body = jsonEncode({"diacritized": teacherAnswer});

    final response = await put(url, headers: headers, body: body);

    int code = response.statusCode;
    print(json.decode(utf8.decode(response.bodyBytes)));

    if (code < 299) {
      AnsweredQuestionsData.addAnswer(teacherAnswer);
    }
    if (code != null) {
      emit(SendAnswerState(code));
    } else {
      emit(SendAnswerState(400));
    }
  }
}
