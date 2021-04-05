import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';

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
            child : FloatingActionButton.extended(
              onPressed: (){},
              label: Text("Apply" , style:AppFonts.appText.copyWith(color: Colors.white)),
            backgroundColor: AppColors.cGreen,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.cWhite, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child : FloatingActionButton.extended(
              icon: SvgPicture.asset('lib/Presentation/Images/yellow_star.svg',),
              onPressed: (){},
              label: Text("Save" , style:AppFonts.appText.copyWith(color: AppColors.cDarkGrey[700])),
            backgroundColor: Colors.white,
            ),
          ),
      ],
    );
  }
}