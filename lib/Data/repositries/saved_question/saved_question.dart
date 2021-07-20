import 'dart:convert';

import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Data/Providers/question_from_response.dart';
import 'package:dsp_teacher_application/Data/repositries/Selected_Question/selected_question.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedQuestionsData {
  const SavedQuestionsData();

  static bool listChanged = true;
  static List<int> savedQuestionsIds = [];
  static List<Question> savedQuestionsFormatted = [];
  static addValue() {
    if (!savedQuestionsIds.contains(SelectedQuestion.selectedQuestion.id)) {
      savedQuestionsIds.add(SelectedQuestion.selectedQuestion.id);
    }
  }

  static Future<void> getSavedQuestions() async {
    if (savedQuestionsIds.isEmpty) await loadFromPhone();
    savedQuestionsFormatted = [];
    final url =
        Uri.parse('http://34.132.143.59:8000/sentences/?diacritized=null');

    final response = await get(url);
    List fetchedData = json.decode(utf8.decode(response.bodyBytes));

    for (int i = 0; i < fetchedData.length; i++) {
      if (savedQuestionsIds.contains(fetchedData[i]['id']))
        savedQuestionsFormatted
            .add(QuestionFromResponse.makeQuestionFromResponse(fetchedData[i]));
    }
    await saveToPhone();
  }

  static Future<void> saveToPhone() async {
    List<String> strList = savedQuestionsIds.map((i) => i.toString()).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("savedQuestionIds", strList);
  }

  static Future<void> loadFromPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> savedStrList = prefs.getStringList('savedQuestionIds');
    savedQuestionsIds = savedStrList.map((i) => int.parse(i)).toList();
    print('loaded: $savedQuestionsIds');
  }
}
