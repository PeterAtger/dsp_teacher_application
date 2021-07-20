import 'package:dsp_teacher_application/Logic/main/ManipulateQ_cubit.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_cubit.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_state.dart';
import 'package:dsp_teacher_application/Logic/main/manipulateQ_state.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/buttonsBar.dart';
import 'package:dsp_teacher_application/Presentation/Pages/home_screen/components/single_question_components/question_tabs.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleQuestionScreen extends StatefulWidget {
  final selectedQuestion;
  const SingleQuestionScreen({Key key, this.selectedQuestion}) : super(key: key);

  @override
  _SingleQuestionScreenState createState() => _SingleQuestionScreenState();
}

class _SingleQuestionScreenState extends State<SingleQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.cWhite,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ManipulateQusetionCubit>(
            create: (BuildContext context) => ManipulateQusetionCubit(),
          ),
          BlocProvider<ChocenChoicCubit>(
            create: (BuildContext context) => ChocenChoicCubit(),
          ),
        ],
        child: BlocBuilder<ChocenChoicCubit, ChocenChoicState>(
          builder: (context, chocenchoicestate) {
            return BlocBuilder<ManipulateQusetionCubit, ManipulateState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    ArabicImage(
                      right: -size.height / 3,
                      top: -size.height / 3,
                      size: size.height / 1.5,
                      opacity: 0.05,
                      blendMode: BlendMode.srcATop,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 72,
                        ),
                        TitleBar(
                          title: 'Question',
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            QuestionViewer(
                              selectedQuestion: chocenchoicestate.answer,
                              scrollData: state.question,
                              defualtText:
                                  'defualt text', // replace with selectedQuestion
                            ),
                            SizedBox(height: 24),
                            Buttons(
                              size: size,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
