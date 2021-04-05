import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/services/questions.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool showUrgent = false;
  String questionLevel = "Primary";
  String displayOption = "Date";
  @override
  Widget build(BuildContext context) {
    questionLevel = ModalRoute.of(context).settings.arguments;
    List<String> questionLevels = ['Primary', 'Preparatory', 'Secondry'];
    List<String> displayOptions = ['Date', 'Option2', 'Option3'];
    var qLevel = {'Primary': 1, 'Preparatory': 2, 'Secondry': 3};
    var avatar = {
      'Primary': 'lib/Presentation/Images/boysvg.svg',
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
      appBar: scrBar(h),
      body: Container(
          height: h * 0.7,
          child: scrBody(
              w, h, questionLevels, avatar, displayOptions, requestedList)),
    );
  }

  PreferredSize scrBar(double h) {
    return PreferredSize(
      preferredSize: Size.fromHeight(h * 0.15),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: h * .05),
        child: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded,
                  size: 25, color: AppColors.cDarkGrey),
              onPressed: () => Navigator.pushNamed(context, '/MainScreen'),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: AutoSizeText('Questions',
              style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey)),
        ),
      ),
    );
  }

  Stack scrBody(
      double w,
      double h,
      List<String> questionLevels,
      Map<String, String> avatar,
      List<String> displayOptions,
      ListView requestedList) {
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
        left: 0.25 * w,
        top: -h * 0.65,
        child: Opacity(
            opacity: 0.12,
            child: Image.asset(
              'lib/Presentation/Images/ArabicCircle.png',
              scale: 1.5,
            )),
      ),
      Column(children: [
        levelMenu(w, questionLevels, avatar),
        filterBar(w, displayOptions),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: UnderLine(),
        ),
        requestedList,
      ]),
    ]);
  }

  Container levelMenu(
      double w, List<String> questionLevels, Map<String, String> avatar) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.05,
        ),
        child: DropdownButton(
          value: questionLevel,
          underline: UnderLine(),
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
      ),
    );
  }

  Container filterBar(double w, List<String> displayOptions) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                          style:
                              AppFonts.smallButtonText.copyWith(fontSize: 15))
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
      ),
    );
  }

  ListView quesViewBuilder(List<Question> ques) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ques.length,
      itemBuilder: (context, index) {
        return Card(
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
              Navigator.pushNamed(context, '/Question',
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
      height: 2,
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
