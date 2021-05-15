import 'package:dsp_teacher_application/Logic/filter_questions/filterquestion_cubit.dart';
import 'package:dsp_teacher_application/Logic/waiting_questions/cubit/waitingquestions_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/questions.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelMenu extends StatelessWidget {
  final double width;
  final List<String> questionLevels;
  final Map<String, String> avatar;
  final String initialValue;

  const LevelMenu(
      {Key key,
      this.width,
      this.questionLevels,
      this.avatar,
      this.initialValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterQuestionCubit, FilterquestionState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.topLeft,
          child: DropdownButton(
            underline: UnderLine(),
            value: state.value == null ? questionLevels[0] : state.value,
            onChanged: (newValue) {
              context.read<FilterQuestionCubit>().chooseFilter(newValue);
              context.read<WaitingQuestionsCubit>().filter(newValue);
            },
            items: questionLevels.map((String valueItem) {
              return DropdownMenuItem(
                  value: valueItem,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        avatar[valueItem],
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(valueItem,
                          style: AppFonts.bodyText1
                              .copyWith(fontWeight: FontWeight.w700))
                    ],
                  ));
            }).toList(),
          ),
        );
      },
    );
  }
}
