import 'package:dsp_teacher_application/Logic/all_questions/allquestions_cubit.dart';
import 'package:dsp_teacher_application/Logic/filter_questions/filterquestion_cubit.dart';
import 'package:dsp_teacher_application/Logic/waiting_questions/cubit/waitingquestions_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/translations/lokale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelMenu extends StatelessWidget {
  final String initialValue;

  const LevelMenu({Key key, @required this.initialValue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> questionLevels = [
      LocaleKeys.All.tr(),
      LocaleKeys.Primary.tr(),
      LocaleKeys.Preparatory.tr(),
      LocaleKeys.Secondary.tr(),
      LocaleKeys.Enthusiast.tr()
    ];
    Map avatar = {
      LocaleKeys.All.tr(): 'lib/Presentation/Images/school.svg',
      LocaleKeys.Primary.tr(): 'lib/Presentation/Images/boy.svg',
      LocaleKeys.Preparatory.tr(): "lib/Presentation/Images/girl.svg",
      LocaleKeys.Secondary.tr(): "lib/Presentation/Images/secondaryboy.svg",
      LocaleKeys.Enthusiast.tr(): "lib/Presentation/Images/enthusiast2.svg"
    };
    // First we have to filter the questions according to the InitialValue
    // context.read<WaitingQuestionsCubit>().filter(this.initialValue);
    // context.read<AllquestionsCubit>().filter(this.initialValue);

    return BlocBuilder<FilterQuestionCubit, FilterquestionState>(
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;

        return Container(
          alignment: Alignment.topLeft,
          child: DropdownButton(
            underline: GradientLine(size: size),
            value: state.value,
            onChanged: (newValue) {
              // On Choosing a new value I filter both pages because I can't bother
              // to make a sperate widget or function for each page!
              context.read<FilterQuestionCubit>().chooseFilter(newValue);
              context.read<WaitingQuestionsCubit>().filter(newValue);
              context.read<AllquestionsCubit>().filter(newValue);
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
