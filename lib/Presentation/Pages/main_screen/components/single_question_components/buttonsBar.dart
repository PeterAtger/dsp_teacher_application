import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Apply",
                style: AppFonts.appText.copyWith(color: Colors.white)),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(4),
                shadowColor: MaterialStateProperty.all(AppColors.cDarkGrey),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 32, vertical: 8)),
                backgroundColor: MaterialStateProperty.all(AppColors.cGreen),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ))),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/Presentation/Images/yellow_star.svg',
              height: 24,
              width: 24,
            ),
            label: Text("Save",
                style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey)),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(4),
                shadowColor: MaterialStateProperty.all(AppColors.cDarkGrey),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 32, vertical: 8)),
                backgroundColor: MaterialStateProperty.all(AppColors.cWhite),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ))),
          ),
        ),
      ],
    );
  }
}
