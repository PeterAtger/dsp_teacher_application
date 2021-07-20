import 'package:dsp_teacher_application/Data/repositries/saved_question/saved_question.dart';
import 'package:dsp_teacher_application/Presentation/translations/lokale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key key,
    @required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(LocaleKeys.Apply.tr(),
                    style: AppFonts.button.copyWith(color: Colors.white)),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(4),
                    shadowColor: MaterialStateProperty.all(AppColors.cDarkGrey),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 32, vertical: 8)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.cGreen),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ))),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  SavedQuestionsData.listChanged = true;
                  SavedQuestionsData.addValue();
                },
                icon: SvgPicture.asset(
                  'lib/Presentation/Images/yellow_star.svg',
                  height: 24,
                  width: 24,
                ),
                label: Text(LocaleKeys.Save.tr(),
                    style:
                        AppFonts.button.copyWith(color: AppColors.cDarkGrey)),
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(AppColors.cDarkGrey[200]),
                    elevation: MaterialStateProperty.all(4),
                    shadowColor: MaterialStateProperty.all(AppColors.cDarkGrey),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 32, vertical: 8)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.cWhite),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
