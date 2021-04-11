import 'package:dsp_teacher_application/Presentation/Global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/NavBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/single_question_components/buttonsBar.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/single_question_components/scroller.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/single_question_components/text_viewer.dart';

class QuestionScreen extends StatefulWidget {
  final selectedQuestion;

  const QuestionScreen({Key key, this.selectedQuestion}) : super(key: key);
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String selectedQuestion;

  @override
  Widget build(BuildContext context) {
    selectedQuestion = widget.selectedQuestion;

    //Preparing text to show in the Text rich so that it can be pressed
    List<String> sentence = selectedQuestion.split(".");
    List<TextSpan> spans = sentence.map((st) {
      return (TextSpan(
        text: st,
        recognizer: TapGestureRecognizer()..onTap = () => print(st),
      ));
    }).toList();

    //Preparing data to show in the Scroll
    List<List<String>> choices = [
      ["Sara", "Doba", "Tata", "Bibo"],
      ["is", "was"],
      ["eating", "sleeping"]
    ];

    List<List<Widget>> scrollData = [];
    for (var choice in choices) {
      List<Text> choi = choice.map((st) {
        return (Text(
          st,
          style: AppFonts.smallButtonText,
        ));
      }).toList();
      scrollData.add(choi);
    }

    //ddeclaring h & w for hight and width so it will be used in sizing throw widgets.
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _ScreenBody(w: w, h: h, spans: spans, scrollData: scrollData),
      bottomNavigationBar: DiffNavBar(),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({
    Key key,
    @required this.w,
    @required this.h,
    @required this.spans,
    @required this.scrollData,
  }) : super(key: key);

  final double w;
  final double h;
  final List<TextSpan> spans;
  final List<List<Widget>> scrollData;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(children: [
        SizedBox(
          height: 72,
        ),
        Row(
          children: [
            SizedBox(width: 32),
            IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded,
                  size: 32, color: AppColors.cDarkGrey),
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(
              width: 8,
            ),
            Text('Questions',
                style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey)),
          ],
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              children: [
                TextViewer(h: h, w: w, spans: spans),
                ScrollingWidget(scrollData: scrollData),
                Buttons(),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
        ),
      ]),
      //Screen Backgroud
      ArabicImage(
        right: -h / 3,
        top: -h / 3,
        size: h / 1.5,
        opacity: 0.05,
        blendMode: BlendMode.srcATop,
      ),
    ]);
  }
}
