import 'package:dsp_teacher_application/Logic/main/ManipulateQ_cubit.dart';
import 'package:dsp_teacher_application/Logic/main/manipulateQ_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Global_components/ArabicImage.dart';
import '../../Global_components/TitleBar.dart';
import '../../Theme/theme.dart';
import 'components/single_question_components/buttonsBar.dart';
import 'components/single_question_components/scroller.dart';
import 'components/single_question_components/text_viewer.dart';

class QuestionScreen extends StatefulWidget {
  final selectedQuestion;

  const QuestionScreen({Key key, this.selectedQuestion}) : super(key: key);
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> list = [
      ['sara', 'was', 'eating', 'apple', 'she', 'is', 'funny'],
      ['Doba', 'is', 'sleeping', 'early', 'she', 'is', 'cute'],
      ['tata', 'has', 'big', 'book', 'he', 'is', 'bad']
    ];
    String selectedQuestion = list[0].join(' ');

    //Preparing data to show in the Scroll

    //ddeclaring h & w for hight and width so it will be used in sizing throw widgets.
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => ManipulateQusetionCubit(),
        child: BlocBuilder<ManipulateQusetionCubit, ManipulateState>(
          builder: (context, state) {
            print(state.question);
            return _ScreenBody(
                w: w, h: h, selectedQuestion: selectedQuestion, scrollData: []);
          },
        ),
      ),
    );
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({
    Key key,
    @required this.w,
    @required this.h,
    @required this.selectedQuestion,
    @required this.scrollData,
  }) : super(key: key);

  final double w;
  final double h;
  final String selectedQuestion;
  final List<List<Widget>> scrollData;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ArabicImage(
        right: -h / 3,
        top: -h / 3,
        size: h / 1.5,
        opacity: 0.05,
        blendMode: BlendMode.srcATop,
      ),
      Column(children: [
        SizedBox(
          height: 72,
        ),
        TitleBar(
          title: 'Question',
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              children: [
                TextViewer(h: h, w: w, selectedQuestion: selectedQuestion),
                // ScrollingWidget(scrollData: scrollData),
                Buttons(),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
        ),
      ]),
    ]);
  }
}
