import 'package:dsp_teacher_application/Data/Models/question.dart';

class QuestionFromResponse {
  const QuestionFromResponse();
  static Question makeQuestionFromResponse(response) {
    return Question(
      id: response['id'],
      question: response["raw"],
      level: Level.values[response["author"]["grade"] - 1],
      isUrgent: response["urgent"],
    );
  }
}
