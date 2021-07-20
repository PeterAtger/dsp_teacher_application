import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Data/repositries/saved_question/saved_question.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/QuestionCard.dart';
import 'package:dsp_teacher_application/Presentation/translations/lokale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

part 'waitingquestions_state.dart';

List<Question> questions = [];

class WaitingQuestionsCubit extends Cubit<WaitingQuestionsState> {
  WaitingQuestionsCubit() : super(WaitingQuestionsState(null));

  //initializing variables and lists

  List<QuestionCard> primaryList = [];
  List<QuestionCard> prepList = [];
  List<QuestionCard> secondaryList = [];
  List<QuestionCard> enthusuastList = [];
  List<QuestionCard> allList = [];
  List<QuestionCard> primaryUrgentList = [];
  List<QuestionCard> prepUrgentList = [];
  List<QuestionCard> secondaryUrgentList = [];
  List<QuestionCard> enthusiastUrgentList = [];
  List<QuestionCard> allUrgentList = [];
  String chosenLevel = 'All';
  bool chosenUrgent = false;

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
    enthusuastList = [];
    enthusiastUrgentList = [];
    for (int i = 0; i < questions.length; i++) {
      allList.add(QuestionCard(
        question: questions[i].question,
        level: questions[i].level,
        isUrgent: questions[i].isUrgent,
      ));

      if (questions[i].level == Level.Primary) {
        primaryList.add(QuestionCard(
            id: questions[i].id,
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Preparatory) {
        prepList.add(QuestionCard(
            id: questions[i].id,
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Secondary) {
        secondaryList.add(QuestionCard(
            id: questions[i].id,
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Enthusiast) {
        enthusuastList.add(QuestionCard(
            id: questions[i].id,
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
    enthusiastUrgentList = [...enthusuastList];
    enthusiastUrgentList.removeWhere((element) => element.isUrgent == false);
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
      } else if (chosenLevel == LocaleKeys.Enthusiast.tr()) {
        emit(WaitingQuestionsState(enthusiastUrgentList));
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
      } else if (chosenLevel == LocaleKeys.Enthusiast.tr()) {
        emit(WaitingQuestionsState(enthusuastList));
      }
    }
  }

  //urgent filter
  void urgentFilter(newValue) async {
    if (SavedQuestionsData.listChanged) {
      await SavedQuestionsData.getSavedQuestions();
      SavedQuestionsData.listChanged = false;
    }
    questions = SavedQuestionsData.savedQuestionsFormatted;
    _listOrder();
    chosenUrgent = newValue;
    _listSelector();
  }

//level filter
  void filter(newValue) async {
    if (SavedQuestionsData.listChanged) {
      await SavedQuestionsData.getSavedQuestions();
      SavedQuestionsData.listChanged = false;
    }
    questions = SavedQuestionsData.savedQuestionsFormatted;
    _listOrder();
    chosenLevel = newValue;
    _listSelector();
  }
}
