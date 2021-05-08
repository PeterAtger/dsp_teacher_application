import 'package:dsp_teacher_application/Logic/answered_questions/answeredquestions_cubit.dart';
import 'package:dsp_teacher_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/home_screen.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/single_question.dart';
import 'package:dsp_teacher_application/Presentation/Pages/router.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavbarCubit>(
          create: (BuildContext context) => NavbarCubit(),
        ),
        BlocProvider<AnsweredQuestionsCubit>(
          create: (BuildContext context) => AnsweredQuestionsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Teacher Demo',
        theme: buildThemeData(),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: '/',
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      // Theme Properties
      primarySwatch: AppColors.cGreen,
      accentColor: AppColors.cGreen,
      highlightColor: AppColors.cDarkGrey[100],
      focusColor: AppColors.cDarkGrey[100],
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'lato',
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0))),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
