import 'package:dsp_teacher_application/Logic/waiting_questions/cubit/waitingquestions_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/questions.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container levelMenu(
    final double w, List<String> questionLevels, Map<String, String> avatar) {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaitingQuestionsCubit, WaitingQuestionsState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.topLeft,
          child: DropdownButton(
            underline: UnderLine(),
            value: questionLevels,
            onChanged: (newValue) {
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
                          style: AppFonts.heading3.copyWith(
                            color: AppColors.cDarkGrey,
                          ))
                    ],
                  ));
            }).toList(),
          ),
        );
      },
    );
  }
}
