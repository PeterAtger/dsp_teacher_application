import 'package:dsp_teacher_application/Data/repositries/Selected_Question/selected_question.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

List<List<String>> initialList = SelectedQuestion.getListFromSelectedQuestion();

class ChocenChoicCubit extends Cubit<ChocenChoicState> {
  ChocenChoicCubit() : super(ChocenChoicState(answer: initialList[0]));

  List<List<String>> list = SelectedQuestion.getListFromSelectedQuestion();

  int globalwordIndex = 0;
  int globallistIndex = 0;
  int globaloffeset = 0;
  int newOffeset;
  List text = initialList[0];
  void getOffeset(int offeset) {
    newOffeset = offeset;
  }

  void scrollChoice(
    int wordIndex,
    int listIndex,
  ) {
    if (wordIndex != -1) {
      globalwordIndex = wordIndex;
    }
    if (listIndex != -1) {
      globallistIndex = listIndex;
    }
    if (newOffeset != -1) {
      globaloffeset = newOffeset * 3;
    }

    text[globallistIndex + globaloffeset] =
        list[globalwordIndex][globallistIndex + globaloffeset];
    print(list[globalwordIndex][globallistIndex + globaloffeset]);
    print(text[globallistIndex + globaloffeset]);
    print('windex: $globalwordIndex');
    print('lindex: $globallistIndex');
    print('oindex: $globaloffeset');
    print('oindex: $newOffeset');
    emit(ChocenChoicState(answer: text));
  }
}
