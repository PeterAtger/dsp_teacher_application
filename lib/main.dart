import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:dsp_teacher_application/Logic/all_questions/allquestions_cubit.dart';
import 'package:dsp_teacher_application/Logic/answered_questions/answeredquestions_cubit.dart';
import 'package:dsp_teacher_application/Logic/authentication/authentication_cubit.dart';
import 'package:dsp_teacher_application/Logic/filter_questions/filterquestion_cubit.dart';
import 'package:dsp_teacher_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_teacher_application/Logic/profile_data/profile_data_cubit.dart';
import 'package:dsp_teacher_application/Logic/waiting_questions/cubit/waitingquestions_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Pages/router.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'lib/Presentation/translations/',
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: App()),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyTopLevelProviders(
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Teacher Demo',
        theme: buildThemeData(),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: Tokens.signInToken != null ? '/' : '/MainScreen',
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

class MyTopLevelProviders extends StatelessWidget {
  const MyTopLevelProviders({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<NavbarCubit>(
        create: (BuildContext context) => NavbarCubit(),
      ),
      BlocProvider<AnsweredQuestionsCubit>(
        create: (BuildContext context) => AnsweredQuestionsCubit(),
      ),
      BlocProvider<WaitingQuestionsCubit>(
        create: (BuildContext context) => WaitingQuestionsCubit(),
      ),
      BlocProvider<FilterQuestionCubit>(
        create: (BuildContext context) => FilterQuestionCubit(),
      ),
      BlocProvider<AuthenticationCubit>(
        create: (BuildContext context) => AuthenticationCubit(),
      ),
      BlocProvider<AllquestionsCubit>(
        create: (BuildContext context) => AllquestionsCubit(),
      ),
      BlocProvider<ProfileDataCubit>(
        create: (context) => ProfileDataCubit(),
      )
    ], child: this.child);
  }
}
