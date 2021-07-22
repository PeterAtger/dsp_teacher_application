import 'package:dsp_teacher_application/Data/repositries/profile_data/profile_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnsweredQuestionsData {
  const AnsweredQuestionsData();

  static List<String> listOfAnswers = [];

  static Future<List<String>> getAnswers() async {
    print(listOfAnswers);
    if (listOfAnswers.isEmpty) await loadFromPhone();
    return listOfAnswers;
  }

  static void addAnswer(String answer) {
    if (!listOfAnswers.contains(answer)) {
      listOfAnswers.add(answer);
    }
    saveToPhone();
  }

  static Future<void> saveToPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (listOfAnswers != null)
      prefs.setStringList("listOfAnswers ${ProfileData.id}", listOfAnswers);
  }

  static Future<void> loadFromPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> loadedList =
        prefs.getStringList('listOfAnswers ${ProfileData.id}');
    if (loadedList != null) listOfAnswers = loadedList;
  }
}
