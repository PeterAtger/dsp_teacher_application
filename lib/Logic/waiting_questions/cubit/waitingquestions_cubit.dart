import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Logic/answered_questions/answeredquestions_cubit.dart';
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
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].level == Level.Primary) {
        print('doba is sleepy');
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
      emit(WaitingQuestionsState(questions
          .map((e) => Waiting(
                question: e.question,
                level: e.level,
                isUrgent: e.isUrgent,
              ))
          .toList()));
      // emit(WaitingQuestionsState(primaryList));
    } else if (newValue == 1) {
      emit(WaitingQuestionsState(prepList));
    } else if (newValue == 2) {
      emit(WaitingQuestionsState(secondaryList));
    }
  }
}
