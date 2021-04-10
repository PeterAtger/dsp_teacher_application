import 'package:dsp_teacher_application/Presentation/global_components/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/gradientOutline.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/side_menu.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/components/main_screen_components/main_screen_table.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //Buttoms Style function
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      primary: AppColors.cDarkGrey[100],
      padding: EdgeInsets.symmetric(vertical: 0.04 * size.height),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
    );
    return Scaffold(
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _ScreenBody(outlineButtonStyle: outlineButtonStyle, size: size),
      drawer: SideMenu(
        size: size,
      ),
      bottomNavigationBar: DiffNavBar(),
    );
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({
    Key key,
    @required this.outlineButtonStyle,
    @required this.size,
  }) : super(key: key);

  final ButtonStyle outlineButtonStyle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(children: [
        SizedBox(
          height: 72,
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 32,
                color: AppColors.cDarkGrey,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            SizedBox(
              width: 8,
            ),
            Text('Main',
                style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey)),
          ],
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back, \n\nWe’ve got new questions waiting \n ",
                style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey),
              ),
              QuestionLevelTable(
                  outlineButtonStyle: outlineButtonStyle, size: size),
              SizedBox(height: 24)
            ],
          ),
        ),
      ]),
    );
  }
}

class QuestionLevelTable extends StatelessWidget {
  const QuestionLevelTable({
    Key key,
    @required this.outlineButtonStyle,
    @required this.size,
  }) : super(key: key);

  final ButtonStyle outlineButtonStyle;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: GradientOutline(
                size: size,
                chld: MainScreenTableItem(
                    txt: 'Primary',
                    img: 'lib/Presentation/Images/boysvg.svg',
                    outlineButtonStyle: outlineButtonStyle,
                    size: size),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: GradientOutline(
                size: size,
                chld: MainScreenTableItem(
                    txt: 'Preparatory',
                    img: 'lib/Presentation/Images/girl.svg',
                    outlineButtonStyle: outlineButtonStyle,
                    size: size),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8),
              child: GradientOutline(
                chld: MainScreenTableItem(
                    txt: 'Secondry',
                    img: 'lib/Presentation/Images/secondaryboy.svg',
                    outlineButtonStyle: outlineButtonStyle,
                    size: size),
                size: size,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  color: AppColors.cGreen,
                ),
                child: MainScreenTableItem(
                    txt: 'Saved',
                    img: 'lib/Presentation/Images/yellow_star.svg',
                    outlineButtonStyle: outlineButtonStyle,
                    size: size),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
