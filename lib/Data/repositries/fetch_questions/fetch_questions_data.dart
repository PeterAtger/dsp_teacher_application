import 'dart:convert';

import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:http/http.dart';

class FetchQuestionsClass {
  Future<List> fetchQuestionsGetRequest() async {
    final url =
        Uri.parse('http://34.132.143.59:8000/sentences/?diacritized=null');
    final headers = {
      "Content-type": "application/json",
      "authorization": "$SIGNINTOKEN",
      "CHARSET": "UTF-8"
    };

    final response = await get(url, headers: headers);
    List fetchedData = json.decode(utf8.decode(response.bodyBytes));

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    int code = response.statusCode;
    List<Question> questions = [
      Question(
          question: fetchedData[0]["raw"],
          level: Level.values[fetchedData[0]["author"]["grade"] - 1],
          isUrgent: fetchedData[0]["urgent"])
    ];
    // for (int i; i < fetchedData.length; i++) {
    //   questions.add(Question(
    //       question: fetchedData[i]['raw'],
    //       level: Level.values[fetchedData[i]["author"]["grade"] - 1],
    //       isUrgent: fetchedData[i]["urgent"]));
    // }

    return ([questions, code]);
  }
}
