// import 'dart:convert';

// import 'package:bloc/bloc.dart';
// import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
// import 'package:http/http.dart';
// import 'package:meta/meta.dart';

// part 'send_answer_state.dart';

// class SendAnswerCubit extends Cubit<SendAnswerState> {
//   SendAnswerCubit() : super(SendAnswerState());
//    Future<void> signInPostRequest(String email, String password) async {
    // final url = Uri.parse('http://34.132.143.59:8000/sentences/$sentenceID/');
    // final headers = {"Content-type": "application/json", "authorization":"Token $SIGNINTOKEN"};
    // final json = jsonEncode({"diacritized": teacherAnswer});

    // final response = await put(url, headers: headers, body: json);
//     Map signInData = jsonDecode(response.body);
//     print(signInData);

//     print('Status code: ${response.statusCode}');
//     print('Body: ${response.body}');
//     int code1 = response.statusCode;

//     emit(SendAnswerState());

   
//   }
// }
