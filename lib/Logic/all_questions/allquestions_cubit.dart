import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Data/repositries/fetch_questions/fetch_questions_data.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/QuestionCard.dart';
import 'package:dsp_teacher_application/Presentation/translations/lokale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

part 'allquestions_state.dart';

class AllquestionsCubit extends Cubit<AllquestionsState> {
  AllquestionsCubit() : super(AllquestionsState(list: null));

  List<Question> questions = [];
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
  bool firstCall = true;
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
        emit(AllquestionsState(list: allUrgentList));
      } else if (chosenLevel == LocaleKeys.Primary.tr()) {
        emit(AllquestionsState(list: primaryUrgentList));
      } else if (chosenLevel == LocaleKeys.Preparatory.tr()) {
        emit(AllquestionsState(list: prepUrgentList));
      } else if (chosenLevel == LocaleKeys.Secondary.tr()) {
        emit(AllquestionsState(list: secondaryUrgentList));
      }
    } else {
      if (chosenLevel == LocaleKeys.All.tr()) {
        emit(AllquestionsState(list: allList));
      } else if (chosenLevel == LocaleKeys.Primary.tr()) {
        emit(AllquestionsState(list: primaryList));
      } else if (chosenLevel == LocaleKeys.Preparatory.tr()) {
        emit(AllquestionsState(list: prepList));
      } else if (chosenLevel == LocaleKeys.Secondary.tr()) {
        emit(AllquestionsState(list: secondaryList));
      }
    }
  }

  //urgent filter
  void urgentFilter(newValue) async {
    firstCall
        ? await fetch.fetchQuestionsGetRequest().then((value) {
            questions = value[0];
            firstCall = false;
          })
        : fetch.fetchQuestionsGetRequest().then((value) {
            questions = value[0];
          });
    _listOrder();
    chosenUrgent = newValue;
    _listSelector();
  }

//level filter
  void filter(newValue) async {
    firstCall
        ? await fetch.fetchQuestionsGetRequest().then((value) {
            questions = value[0];
            firstCall = false;
          })
        : fetch.fetchQuestionsGetRequest().then((value) {
            questions = value[0];
          });
    _listOrder();
    chosenLevel = newValue;
    _listSelector();
  }
}
