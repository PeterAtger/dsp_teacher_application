import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/gradientOutline.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/side_menu.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/nav_bar.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/main_screen_components/main_screen_table.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {  
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    //Buttoms Style function
    final ButtonStyle outlineButtonStyle  = OutlinedButton.styleFrom(
      primary: AppColors.cPurple[900],
      padding: EdgeInsets.symmetric(vertical: 0.02*h),
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    );
    return Scaffold(
      appBar: scrBar(h),
      body: Container(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
              Text("Welcome Back, \n" , style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey[900]),),
              Text("We’ve got new questions waiting \n" , style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey[900]),),
              QuestionLevelTable(outlineButtonStyle: outlineButtonStyle, h: h),
            ]) ,
      ),
      drawer: SideMenu(),
      bottomNavigationBar:NavBar(),
  );}


  PreferredSize scrBar(double h) {
    return PreferredSize(
   preferredSize: Size.fromHeight(h*0.18),
   child: Padding(
     padding: EdgeInsets.symmetric(vertical:h*.05),
     child: AppBar(
       leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu,    size: 32,   color: AppColors.cDarkGrey[700],),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),  
        elevation: 0,
        backgroundColor: Colors.transparent,
        title : Text('Main', style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey[800])),
     ),),);
  }}

class QuestionLevelTable extends StatelessWidget {
  const QuestionLevelTable({
    Key key,
    @required this.outlineButtonStyle,
    @required this.h,
  }) : super(key: key);

  final ButtonStyle outlineButtonStyle;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: GradientOutline(chld: MainScreenTableItem(txt: 'Primary',img: 'lib/Presentation/Images/boysvg.svg',outlineButtonStyle: outlineButtonStyle, h: h ),),
            ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: GradientOutline(chld: MainScreenTableItem(txt: 'Preparatory',img: 'lib/Presentation/Images/girl.svg',outlineButtonStyle: outlineButtonStyle, h: h ),),
            ),
        ],
        ),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GradientOutline(chld: MainScreenTableItem(txt: 'Secondry',img: 'lib/Presentation/Images/secondaryboy.svg',outlineButtonStyle: outlineButtonStyle, h: h ),),
          ), 
              
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(22)),
              color:AppColors.cGreen,),
              child: MainScreenTableItem(txt: 'Saved',img: 'lib/Presentation/Images/yellow_star.svg',outlineButtonStyle: outlineButtonStyle, h: h ),),
            ),
        ],
        ),
      ],
    );
  }
}


