import 'package:adobe_xd/blend_mask.dart';
import 'package:dsp_teacher_application/Logic/waiting_questions/cubit/waitingquestions_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/LevelMenu.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaitingQuestions extends StatefulWidget {
  @override
  _WaitingQuestionsState createState() => _WaitingQuestionsState();
}

class _WaitingQuestionsState extends State<WaitingQuestions> {
  bool switchValue;
  @override
  void initState() {
    switchValue = false;
    super.initState();
  }

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
          TitleBar(title: LocaleKeys.WaitingQuestion.tr()),
          SizedBox(height: 24),
          Padding(
            padding:
                const EdgeInsets.only(left: 32, top: 8, bottom: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelMenu(
                  initialValue: LocaleKeys.All.tr(),
                ),
                Container(
                  width: size.width / 3,
                  child: SwitchListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('${LocaleKeys.UrgentOnly.tr()} :',
                          style: AppFonts.captionText),
                      value: switchValue,
                      onChanged: (newValue) {
                        context
                            .read<WaitingQuestionsCubit>()
                            .urgentFilter(newValue);
                        setState(() {
                          switchValue = newValue;
                        });
                      }),
                ),
              ],
            ),
          ),
          BlocBuilder<WaitingQuestionsCubit, WaitingQuestionsState>(
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
