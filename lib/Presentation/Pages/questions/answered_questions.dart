import 'package:adobe_xd/blend_mask.dart';
import 'package:dsp_teacher_application/Logic/answered_questions/answeredquestions_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_teacher_application/Presentation/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnsweredQuestions extends StatefulWidget {
  @override
  _AnsweredQuestionsState createState() => _AnsweredQuestionsState();
}

class _AnsweredQuestionsState extends State<AnsweredQuestions> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      Positioned(
        right: -size.height / 3,
        top: -size.height / 3,
        child: Container(
          width: size.height / 1.5,
          height: size.height / 1.5,
          child: BlendMask(
              blendMode: BlendMode.srcOver,
              opacity: 0.1,
              child: Image.asset('lib/Presentation/Images/ArabicCircle.png')),
        ),
      ),
      SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 72),
          TitleBar(title: LocaleKeys.AnsweredQuestions.tr()),
          SizedBox(height: 24),
          BlocBuilder<AnsweredQuestionsCubit, AnsweredQuestionsState>(
            builder: (context, state) {
              return Column(
                children: state.list == null ? [Container()] : state.list,
              );
            },
          )
        ]),
      )
    ]));
  }
}
