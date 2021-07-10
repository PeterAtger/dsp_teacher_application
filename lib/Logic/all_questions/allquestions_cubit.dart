import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/QuestionCard.dart';
import 'package:meta/meta.dart';

part 'allquestions_state.dart';

List<Question> questions = [
  Question(
      isUrgent: true,
      level: Level.Primary,
      question: 'These are some respectable Examples'),
  Question(
      isUrgent: false,
      level: Level.Primary,
      question: 'Not like the asshole doba'),
  Question(
      isUrgent: false,
      level: Level.Preparatory,
      question: 'Because I am very respectable person'),
  Question(
      isUrgent: true,
      level: Level.Secondary,
      question: 'Now !!! Where the fuck is my Son IBIRAHEEEEM?')
];

class AllquestionsCubit extends Cubit<AllquestionsState> {
  AllquestionsCubit() : super(AllquestionsState(list: null));

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
      if (chosenLevel == 'All') {
        emit(AllquestionsState(list: allUrgentList));
      } else if (chosenLevel == 'Primary') {
        emit(AllquestionsState(list: primaryUrgentList));
      } else if (chosenLevel == 'Preparatory') {
        emit(AllquestionsState(list: prepUrgentList));
      } else if (chosenLevel == 'Secondary') {
        emit(AllquestionsState(list: secondaryUrgentList));
      }
    } else {
      if (chosenLevel == 'All') {
        emit(AllquestionsState(list: allList));
      } else if (chosenLevel == 'Primary') {
        emit(AllquestionsState(list: primaryList));
      } else if (chosenLevel == 'Preparatory') {
        emit(AllquestionsState(list: prepList));
      } else if (chosenLevel == 'Secondary') {
        emit(AllquestionsState(list: secondaryList));
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
    _listOrder();
    chosenLevel = newValue;
    _listSelector();
  }
}
