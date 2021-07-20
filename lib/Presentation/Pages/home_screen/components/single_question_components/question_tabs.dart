import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/Tabs.dart';
import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/editable_text.dart';
import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/scroller.dart';
import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/selected_text_viewer.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionViewer extends StatefulWidget {
  final List<String> selectedQuestion;
  final List<List> scrollData;
  final String defualtText;
  const QuestionViewer(
      {Key key, this.selectedQuestion, this.scrollData, this.defualtText})
      : super(key: key);

  @override
  _QuestionViewerState createState() => _QuestionViewerState();
}

class _QuestionViewerState extends State<QuestionViewer>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            Column(children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    color: AppColors.cLightGrey,
                  ),
                  width: size.width * 0.4,
                  height: 48,
                  child: TabBar(
                      controller: _controller,
                      unselectedLabelColor: AppColors.cGreen.shade400,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        color: AppColors.cGreen,
                      ),
                      labelColor: AppColors.cWhite,
                      tabs: [
                        Text(
                          'Manual',
                          style: AppFonts.captionText,
                        ),
                        Text(
                          'Easy',
                          style: AppFonts.captionText,
                        ),
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: AppColors.cGreen,
                ),
                height: size.height * 0.35,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(
                      controller: _controller,
                      physics:
                          NeverScrollableScrollPhysics(parent: ScrollPhysics()),
                      children: [
                        TabFrame(
                          size: size,
                          tap: '1',
                          widget: EditableTextTab(
                            defultText: widget.defualtText,
                          ),
                        ),
                        TabFrame(
                          size: size,
                          tap: '2',
                          widget: TextViewer(
                              selectedQuestion: widget.selectedQuestion),
                        ),
                      ]),
                ),
              )
            ]),
            SizedBox(
              height: 24,
            ),
            _selectedIndex == 1
                ? DelayedDisplay(
                    delay: Duration(microseconds: 10),
                    child: ScrollingWidget(scrollData: widget.scrollData))
                : SizedBox(
                    height: size.height * 0.05,
                  ),
          ],
        ),
      ),
    );
  }
}
