import 'package:dsp_teacher_application/Data/Models/question.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/LevelMenu.dart';
import 'package:dsp_teacher_application/Presentation/global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/global_components/TitleBar.dart';
import 'package:dsp_teacher_application/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';

class Questions extends StatefulWidget {
  final String argument;
  const Questions({Key key, this.argument}) : super(key: key);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool showUrgent;
  String questionLevel;
  List<String> displayOptions = ['Date', 'Alphabetical'];
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

    Size size = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
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
                LevelMenu(questionLevels: questionLevels, avatar: avatar),
                Container(
                  child: Row(children: [
                    Text(
                      "Sorted By: ",
                      style: AppFonts.button,
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
                                Text(valueItem, style: AppFonts.button)
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
                ),
                GradientLine(size: size),
              ]),
            ),
          ],
        ),
      ]),
    );
  }
}
