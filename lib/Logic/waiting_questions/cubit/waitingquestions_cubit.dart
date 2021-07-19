import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/QuestionCard.dart';
import 'package:dsp_teacher_application/Presentation/translations/lokale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:dsp_teacher_application/Data/repositries/fetch_questions/fetch_questions_data.dart';

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

  //initializing variables and lists

  List<QuestionCard> primaryList = [];
  List<QuestionCard> prepList = [];
  List<QuestionCard> secondaryList = [];
  List<QuestionCard> allList = [];
  List<QuestionCard> primaryUrgentList = [];
  List<QuestionCard> prepUrgentList = [];
  List<QuestionCard> secondaryUrgentList = [];
  List<QuestionCard> allUrgentList = [];
  String chosenLevel = 'All';
  bool chosenUrgent = false;
  FetchQuestionsClass fetch = FetchQuestionsClass();

//making the eight lists
  void _listOrder() {
    primaryList = [];
    prepList = [];
    secondaryList = [];
    allList = [];
    primaryUrgentList = [];
    prepUrgentList = [];
    secondaryUrgentList = [];
    allUrgentList = [];
    for (int i = 0; i < questions.length; i++) {
      allList.add(QuestionCard(
        question: questions[i].question,
        level: questions[i].level,
        isUrgent: questions[i].isUrgent,
      ));

      if (questions[i].level == Level.Primary) {
        primaryList.add(QuestionCard(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Preparatory) {
        prepList.add(QuestionCard(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Secondary) {
        secondaryList.add(QuestionCard(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      }
    }
    allUrgentList = [...allList];
    allUrgentList.removeWhere((element) => element.isUrgent == false);
    primaryUrgentList = [...primaryList];
    primaryUrgentList.removeWhere((element) => element.isUrgent == false);
    prepUrgentList = [...prepList];
    prepUrgentList.removeWhere((element) => element.isUrgent == false);
    secondaryUrgentList = [...secondaryList];
    secondaryUrgentList.removeWhere((element) => element.isUrgent == false);
  }

  void _listSelector() {
    if (chosenUrgent == true) {
      if (chosenLevel == LocaleKeys.All.tr()) {
        emit(WaitingQuestionsState(allUrgentList));
      } else if (chosenLevel == LocaleKeys.Primary.tr()) {
        emit(WaitingQuestionsState(primaryUrgentList));
      } else if (chosenLevel == LocaleKeys.Preparatory.tr()) {
        emit(WaitingQuestionsState(prepUrgentList));
      } else if (chosenLevel == LocaleKeys.Secondary.tr()) {
        emit(WaitingQuestionsState(secondaryUrgentList));
      }
    } else {
      if (chosenLevel == LocaleKeys.All.tr()) {
        emit(WaitingQuestionsState(allList));
      } else if (chosenLevel == LocaleKeys.Primary.tr()) {
        emit(WaitingQuestionsState(primaryList));
      } else if (chosenLevel == LocaleKeys.Preparatory.tr()) {
        emit(WaitingQuestionsState(prepList));
      } else if (chosenLevel == LocaleKeys.Secondary.tr()) {
        emit(WaitingQuestionsState(secondaryList));
      }
    }
  }

  //urgent filter
  void urgentFilter(newValue) {
    _listOrder();
    chosenUrgent = newValue;
    _listSelector();
  }

//level filter
  void filter(newValue) {
    // fetch.fetchQuestionsGetRequest().then((value) => {questions = value[0]});
    _listOrder();
    chosenLevel = newValue;
    _listSelector();
  }
}
