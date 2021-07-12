import 'package:dsp_teacher_application/Logic/all_questions/allquestions_cubit.dart';
import 'package:dsp_teacher_application/Logic/filter_questions/filterquestion_cubit.dart';
import 'package:dsp_teacher_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenTableItem extends StatelessWidget {
  const MainScreenTableItem({
    Key key,
    @required this.outlineButtonStyle,
    @required this.img,
    @required this.size,
    @required this.txt,
    this.isSaved = false,
  }) : super(key: key);

  final ButtonStyle outlineButtonStyle;
  final String img;
  final Size size;
  final String txt;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: outlineButtonStyle,
      onPressed: isSaved
          ? () {
              context.read<NavbarCubit>().goToSavedQuestions();
            }
          : () async {
              context.read<FilterQuestionCubit>().chooseFilter(txt);
              context.read<AllquestionsCubit>().filter(txt);
              await Future.delayed(Duration(milliseconds: 250), () {
                Navigator.of(context)
                    .pushNamed('/MainScreen/Questions', arguments: txt);
              });
            },
      child: Column(children: [
        SvgPicture.asset(img, height: 56),
        SizedBox(
          height: 8,
        ),
        Text(txt,
            style: AppFonts.bodyText1.copyWith(
              color: this.isSaved ? AppColors.cWhite : AppColors.cDarkGrey,
            ))
      ]),
    );
  }
}
