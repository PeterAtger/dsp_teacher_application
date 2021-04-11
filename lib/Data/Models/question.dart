import 'package:dsp_teacher_application/Data/Models/answers.dart';

enum Level { Primary, Preparatory, Secondary }

class Question {
  String question;
  bool isUrgent;
  Level level;
  Answers answers;
}
