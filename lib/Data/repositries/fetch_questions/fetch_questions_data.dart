import 'dart:convert';

import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:http/http.dart';

class FetchQuestionsClass {
  static List<Question> questions = [];

  Future<List> fetchQuestionsGetRequest() async {
    final url =
        Uri.parse('http://34.132.143.59:8000/sentences/?diacritized=null');
    final headers = {
      "Content-type": "application/json",
      "authorization": "$Tokens.signInToken",
      "CHARSET": "UTF-8"
    };

    final response = await get(url, headers: headers);
    List fetchedData = json.decode(utf8.decode(response.bodyBytes));

    int code = response.statusCode;
    questions = [];

    for (int i = 0; i < fetchedData.length; i++) {
      questions.add(Question(
        id: fetchedData[i]['id'],
        question: fetchedData[i]["raw"],
        level: Level.values[fetchedData[i]["author"]["grade"] - 1],
        isUrgent: fetchedData[i]["urgent"],
      ));
    }
    print(questions);
    return ([questions, code]);
  }
}
