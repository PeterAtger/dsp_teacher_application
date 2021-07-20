import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'send_answer_state.dart';

class SendAnswerCubit extends Cubit<SendAnswerState> {
  SendAnswerCubit() : super(SendAnswerState(null));
  Future<void> postAnswer(String email, String password, int sentenceID,
      String teacherAnswer) async {
    final url = Uri.parse('http://34.132.143.59:8000/sentences/$sentenceID/');
    final headers = {
      "Content-type": "application/json",
      "authorization": "Token ${Tokens.signInToken}"
    };
    final json = jsonEncode({"diacritized": teacherAnswer});

    final response = await put(url, headers: headers, body: json);
    Map confirmedQuestion = jsonDecode(response.body);

    int code = response.statusCode;

    emit(SendAnswerState(code));
  }
}
