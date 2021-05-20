import 'package:dsp_teacher_application/Data/Models/answers.dart';

enum Level { Primary, Preparatory, Secondary }

class Question {
  final String question;
  final bool isUrgent;
  final Level level;
  final Answers answers;

  Question({this.question, this.isUrgent, this.level, this.answers});
}
