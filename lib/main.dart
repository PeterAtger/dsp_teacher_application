import 'package:dsp_teacher_application/Presentation/Pages/router.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Teacher Demo',
      theme: ThemeData(
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
      ),
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}
