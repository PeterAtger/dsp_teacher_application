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

// level filter

class WaitingQuestionsCubit extends Cubit<WaitingQuestionsState> {
  WaitingQuestionsCubit() : super(WaitingQuestionsState(null));

  //initializing variables and lists

  List<Waiting> primaryList = [];
  List<Waiting> prepList = [];
  List<Waiting> secondaryList = [];
  List<Waiting> allList = [];
  String chosenLevel = 'All';

  void filter(newValue) {
    chosenLevel = newValue;
    primaryList = [];
    prepList = [];
    secondaryList = [];
    allList = [];
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

    if (newValue == 'All') {
      emit(WaitingQuestionsState(allList));
    } else if (newValue == 'Primary') {
      emit(WaitingQuestionsState(primaryList));
    } else if (newValue == 'Preparatory') {
      emit(WaitingQuestionsState(prepList));
    } else if (newValue == 'Secondary') {
      emit(WaitingQuestionsState(secondaryList));
    }
  }

  // urgent filter
  void urgentFilter(newValue) {
    List<Waiting> urgentList = [];
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].isUrgent == true) {
        urgentList.add(Waiting(
          isUrgent: questions[i].isUrgent,
          question: questions[i].question,
          level: questions[i].level,
        ));
      }
    }
    if (newValue == true)
      emit(WaitingQuestionsState(urgentList));
    else
      emit(WaitingQuestionsState(allList));
  }
}
