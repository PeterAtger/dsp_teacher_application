import 'package:dsp_teacher_application/Logic/main/check_cubit_matrix.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

List<List<String>> intialList = removepoint([
  ['habiba', 'is', 'playing', 'coco', '.', 'apple', 'is', 'funny'],
  ['Doba', 'always', 'sleep', 'early', 'she', 'is', 'cute'],
  ['tata', 'has', 'big', 'book', 'he', 'is', 'sad']
]);

class ChocenChoicCubit extends Cubit<ChocenChoicState> {
  ChocenChoicCubit() : super(ChocenChoicState(answer: intialList[0]));
  List<List<String>> list = removepoint([
    ['habiba', 'is', 'playing', 'coco', 'apple', 'is', 'funny'],
    ['Doba', 'always', 'sleep', 'early', 'she', 'is', 'cute'],
    ['tata', 'has', 'big', 'book', 'he', 'is', 'sad']
  ]);
  int globalwordIndex = 0;
  int globallistIndex = 0;
  int globaloffeset = 0;
  int newOffeset;
  List text = intialList[0];
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
