import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/nav_bar.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/single_question_components/buttonsBar.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/single_question_components/scroller.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/single_question_components/text_viewer.dart';


class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  
  @override
  Widget build(BuildContext context) {

  //Preparing text to show in the Text rich so that it can be pressed
    String paragraph=ModalRoute.of(context).settings.arguments;
    List<String> sentence=paragraph.split(".");
    List<TextSpan>spans=sentence.map((st){return(TextSpan(text:st,recognizer:  TapGestureRecognizer()..onTap = () => print(st),));}).toList();

  //Preparing data to show in the Scroll 
    List<List<String>>choices=[["Sara","Doba","Tata","Bibo"],["is","was"],["eating","sleeping"]];
    List<List<Widget>>scrollData=[];
    for (var choice in choices) {
          List<Widget>choi=
          choice.map((st){return(Text(st,style: AppFonts.appText,));}).toList();
        scrollData.add(choi);    
      }

    //ddeclaring h & w for hight and width so it will be used in sizing throw widgets. 
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: scrBar(h),
      body: 
      Stack(
        clipBehavior: Clip.none,
        children: [
          //Screen Backgroud
          Positioned(left: 0.25*w, top:-h*0.65 ,
            child:Opacity(
            opacity:0.12,
            child:  Image.asset(
              'lib/Presentation/Images/ArabicCircle.png',
              scale:1.5 ,)
            ),
          ),
          //ScreenContent
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[ 
              TextViewer(h: h, w: w, spans: spans),
              ScrollingWidget(scrollData: scrollData),
              Buttons(),
            ]
          ),
        ]),
    bottomNavigationBar: NavBar(),
    );
}

  PreferredSize scrBar(double h) {
    return PreferredSize(
   preferredSize: Size.fromHeight(h*0.18),
   child: Padding(
     padding: EdgeInsets.symmetric(vertical:h*.05),
     child: AppBar(
      leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, size: 25, color:AppColors.cDarkGrey[800]), 
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/QuestionsList')),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title : Text(
          'Question', style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey[800])),
     ),),);
  }}
