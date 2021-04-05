import 'package:dsp_teacher_application/Presentation/global_components/ArabicImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/services/questions.dart';

class Questions extends StatefulWidget {
  final String argument;
  const Questions({Key key, this.argument}) : super(key: key);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool showUrgent = false;
  String questionLevel = 'Primary';
  List<String> questionLevels = ['Primary', 'Preparatory', 'Secondry'];
  List<String> displayOptions = ['Date', 'Option2', 'Option3'];
  String displayOption = "Date";

  @override
  Widget build(BuildContext context) {
    questionLevel = widget.argument;
    var qLevel = {'Primary': 1, 'Preparatory': 2, 'Secondry': 3};
    var avatar = {
      'Primary': 'lib/Presentation/Images/boy.svg',
      'Preparatory': "lib/Presentation/Images/girl.svg",
      'Secondry': "lib/Presentation/Images/secondaryboy.svg"
    };
    int requestedLevel = qLevel[questionLevel];
    List<Question> ques = [
      Question(
          ques: "Example sentence #1. I want to split it",
          level: 1,
          isUrgent: true),
      Question(ques: "Example sentence #2.", level: 1, isUrgent: false),
      Question(ques: "Example sentence #3.", level: 3, isUrgent: true),
      Question(ques: "Example sentence #4.", level: 3, isUrgent: true),
      Question(ques: "Example sentence #5.", level: 2, isUrgent: false),
      Question(ques: "Example sentence #6.", level: 3, isUrgent: false),
    ];
    ques.removeWhere((item) => (item.level != requestedLevel));
    ques.removeWhere((item) => (item.isUrgent == false && showUrgent == true));
    ListView requestedList = quesViewBuilder(ques);

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body:
          scrBody(w, h, questionLevels, avatar, displayOptions, requestedList),
    );
  }

  Stack scrBody(
      double w,
      double h,
      List<String> questionLevels,
      Map<String, String> avatar,
      List<String> displayOptions,
      ListView requestedList) {
    return Stack(children: [
      Column(
        children: [
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
                  style:
                      AppFonts.heading2.copyWith(color: AppColors.cDarkGrey)),
            ],
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              levelMenu(w, questionLevels, avatar),
              SizedBox(
                height: 16,
              ),
              filterBar(w, displayOptions),
              UnderLine(),
              requestedList,
            ]),
          ),
        ],
      ),
      ArabicImage(
        right: -h / 3,
        top: -h / 3,
        size: h / 1.5,
        opacity: 0.05,
        blendMode: BlendMode.srcATop,
      )
    ]);
  }

  Container levelMenu(
      final double w, List<String> questionLevels, Map<String, String> avatar) {
    return Container(
      alignment: Alignment.topLeft,
      child: DropdownButton(
        underline: UnderLine(),
        value: questionLevel,
        onChanged: (newValue) {
          setState(() {
            questionLevel = newValue;
          });
        },
        items: questionLevels.map((String valueItem) {
          return DropdownMenuItem(
              value: valueItem,
              child: Row(
                children: [
                  SvgPicture.asset(
                    avatar[valueItem],
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(valueItem,
                      style: AppFonts.heading3.copyWith(
                        color: AppColors.cDarkGrey,
                      ))
                ],
              ));
        }).toList(),
      ),
    );
  }

  Container filterBar(double w, List<String> displayOptions) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Sorted By",
          style: AppFonts.smallButtonText,
        ),
        DropdownButton<String>(
          value: displayOption,
          onChanged: (newValue) {
            setState(() {
              displayOption = newValue;
            });
          },
          items: displayOptions.map((String valueItem) {
            return DropdownMenuItem<String>(
                value: valueItem,
                child: Row(
                  children: [
                    Text(valueItem,
                        style: AppFonts.smallButtonText.copyWith(fontSize: 15))
                  ],
                ));
          }).toList(),
        ),
        Text(
          "Urgent Only",
          style: AppFonts.smallButtonText,
        ),
        Transform.scale(
          scale: 0.75,
          child: Switch(
              value: showUrgent,
              activeColor: AppColors.cGreen,
              onChanged: (value) {
                setState(() {
                  showUrgent = value;
                  print(showUrgent);
                });
              }),
        ),
      ]),
    );
  }

  ListView quesViewBuilder(List<Question> ques) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ques.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: (index.isOdd) ? null : AppColors.cGreen[100],
          child: ListTile(
            title: Text(
              ques[index].ques,
              style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.cDarkGrey,
            ),
            leading: Icon(
              Icons.brightness_1,
              color: (ques[index].isUrgent)
                  ? AppColors.cGreen
                  : AppColors.cDarkGrey,
              size: 24,
            ),
            onTap: () {
              Navigator.pushNamed(
                  context, '/MainScreen/Questions/QuestionScreen',
                  arguments: ques[index].ques);
            },
          ),
        );
      },
    );
  }
}

class UnderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1, 0.0),
          colors: [AppColors.cPurple, AppColors.cGreen],
        ),
      ),
    );
  }
}
