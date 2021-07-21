import 'package:dsp_teacher_application/Data/Models/question.dart';

class SelectedQuestion {
  static Question selectedQuestion;

  static void setSelectedQuestion(Question question) {
    selectedQuestion = question;
    print(selectedQuestion);
  }

  static void destroySelectedQuestion() {
    selectedQuestion = null;
  }

  static Question getSelectedQuestion() {
    if (selectedQuestion != null) {
      return selectedQuestion;
    }
  }

  static List<List<String>> getListFromSelectedQuestion() {
    // TODO : List the answers not the question
    List listOfQuestion = selectedQuestion.question.split(' ');
    return [listOfQuestion, listOfQuestion];
  }
}
