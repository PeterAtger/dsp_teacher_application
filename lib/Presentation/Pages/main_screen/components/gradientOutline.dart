import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class GradientOutline extends StatelessWidget {
  const GradientOutline({
    Key key,
    @required this.chld,
  }) : super(key: key);
  final Widget chld;
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(3),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(22)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end:Alignment(0.9, 0.0), 
        colors: [AppColors.cPurple[900], AppColors.cGreen[900]], 
        tileMode: TileMode.clamp, 
      ),),
      child: Container(         
        decoration: BoxDecoration(
          color: AppColors.cWhite,
          borderRadius: BorderRadius.all(Radius.circular(22)),),
        child: chld,
      ),
    );
  }
}