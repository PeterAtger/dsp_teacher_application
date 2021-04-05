import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/main_screen.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/questions.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/single_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(initialRoute: '/MainScreen', routes: {
      '/MainScreen': (context) => MainScreen(),
      '/QuestionsList': (context) => Questions(),
      '/Question': (context) => QuestionScreen(),
      '/profile': (context) => Profile(),
    }));
/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: AppColors.cPurple,
        accentColor: AppColors.cGreen,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'lato',
        buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0))),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.generateRoute,
      routes: {
        '/': (context) => HIW(),
      },
    );
  }
}
*/
