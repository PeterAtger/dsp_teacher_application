import 'package:dsp_teacher_application/Logic/main/ManipulateQ_cubit.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_cubit.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_state.dart';
import 'package:dsp_teacher_application/Logic/main/manipulateQ_state.dart';
import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/buttonsBar.dart';
import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/question_tabs.dart';
import 'package:dsp_teacher_application/Presentation/global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/global_components/TitleBar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dsp_teacher_application/Presentation/translations/lokale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionScreen extends StatefulWidget {
  final selectedQuestion;

  const QuestionScreen({Key key, this.selectedQuestion}) : super(key: key);
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    // List<List<String>> list = [
    //   ['habiba', 'is', 'playing', 'coco', '.', 'apple', 'is', 'funny'],
    //   ['Doba', 'always', 'sleep', 'early', 'she', 'is', 'cute'],
    //   ['tata', 'has', 'big', 'book', 'he', 'is', 'sad']
    // ];

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ManipulateQusetionCubit>(
            create: (BuildContext context) => ManipulateQusetionCubit(),
          ),
          BlocProvider<ChocenChoicCubit>(
            create: (BuildContext context) => ChocenChoicCubit(),
          ),
        ],
        child: BlocBuilder<ChocenChoicCubit, ChocenChoicState>(
          builder: (context, chocenchoicestate) {
            return BlocBuilder<ManipulateQusetionCubit, ManipulateState>(
              builder: (context, state) {
                return _ScreenBody(
                    size: size,
                    selectedQuestion: chocenchoicestate.answer,
                    scrollData: state.question);
              },
            );
          },
        ),
      ),
    );
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({
    Key key,
    @required this.selectedQuestion,
    this.scrollData = const [],
    @required this.size,
  }) : super(key: key);

  final Size size;
  final List<String> selectedQuestion;
  final List<List<Widget>> scrollData;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //Screen Backgroud
      ArabicImage(
        right: -size.height / 3,
        top: -size.height / 3,
        size: size.height / 1.5,
        opacity: 0.05,
        blendMode: BlendMode.srcATop,
      ),
      Column(children: [
        SizedBox(
          height: 72,
        ),
        TitleBar(
          title: LocaleKeys.Question.tr(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                QuestionViewer(),
                Buttons(
                  size: size,
                ),
              ],
            ),
          ),
        ),
      ]),
    ]);
  }
}
