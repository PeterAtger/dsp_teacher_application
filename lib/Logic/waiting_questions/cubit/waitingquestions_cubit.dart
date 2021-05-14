import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Presentation/Pages/questions/local_components/Waiting.dart';
import 'package:meta/meta.dart';

part 'waitingquestions_state.dart';

List<Question> questions = [
  Question(
      isUrgent: true,
      level: Level.Primary,
      question: 'is tata stupid yes of course he is?'),
  Question(
      isUrgent: false,
      level: Level.Primary,
      question: 'tata is a kangaarooo and an iceberg?'),
  Question(
      isUrgent: false,
      level: Level.Preparatory,
      question: 'you are right tata is buffalo'),
  Question(
      isUrgent: true,
      level: Level.Secondary,
      question: 'you are double right tata is a cow')
];

class WaitingQuestionsCubit extends Cubit<WaitingQuestionsState> {
  WaitingQuestionsCubit() : super(WaitingQuestionsState(null));

  void filter(newValue) {
    List<Waiting> primaryList = [];
    List<Waiting> prepList = [];
    List<Waiting> secondaryList = [];
    List<Waiting> allList = [];
    for (int i = 0; i < questions.length; i++) {
      allList.add(Waiting(
        question: questions[i].question,
        level: questions[i].level,
        isUrgent: questions[i].isUrgent,
      ));

      if (questions[i].level == Level.Primary) {
        primaryList.add(Waiting(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Preparatory) {
        prepList.add(Waiting(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Secondary) {
        secondaryList.add(Waiting(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      }
    }

    if (newValue == 0) {
      emit(WaitingQuestionsState(allList));
    } else if (newValue == 1) {
      emit(WaitingQuestionsState(primaryList));
    } else if (newValue == 2) {
      emit(WaitingQuestionsState(prepList));
    } else if (newValue == 3) {
      emit(WaitingQuestionsState(secondaryList));
    }
  }
}
