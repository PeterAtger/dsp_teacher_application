import 'package:dsp_teacher_application/Presentation/Global_components/LevelMenu.dart';
import 'package:dsp_teacher_application/Presentation/global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/global_components/TitleBar.dart';
import 'package:dsp_teacher_application/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/services/questions.dart';

class Questions extends StatefulWidget {
  final String argument;
  const Questions({Key key, this.argument}) : super(key: key);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool showUrgent;

  String questionLevel;

  List<String> displayOptions = ['Date', 'Alphabetical', 'Option3'];
  String displayOption;

  @override
  void initState() {
    showUrgent = true;
    questionLevel = 'Primary';
    displayOption = "Date";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questionLevel = widget.argument;
    var qLevel = {'Primary': 1, 'Preparatory': 2, 'Secondry': 3};

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
      ArabicImage(
        right: -h / 3,
        top: -h / 3,
        size: h / 1.5,
        opacity: 0.05,
        blendMode: BlendMode.srcATop,
      ),
      Column(
        children: [
          SizedBox(
            height: 72,
          ),
          TitleBar(
            hasBackButton: true,
            title: 'Questions',
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              LevelMenu(
                  width: w, questionLevels: questionLevels, avatar: avatar),
              filterBar(w, displayOptions),
              UnderLine(),
            ]),
          ),
          requestedList,
        ],
      ),
    ]);
  }

  Container filterBar(double w, List<String> displayOptions) {
    return Container(
      child: Row(children: [
        Text(
          "Sorted By: ",
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
        Expanded(
          flex: 1,
          child: SwitchListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              'Urgent Only: ',
              maxLines: 2,
            ),
            value: showUrgent,
            onChanged: (isOn) {
              setState(() {
                showUrgent = isOn;
              });
              print(isOn);
            },
          ),
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
