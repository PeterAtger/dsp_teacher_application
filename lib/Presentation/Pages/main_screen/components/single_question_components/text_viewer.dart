import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';


class TextViewer extends StatelessWidget {
  const TextViewer({
    Key key,
    @required this.h,
    @required this.w,
    @required this.spans,
  }) : super(key: key);

  final double h;
  final double w;
  final List<TextSpan> spans;

  @override
  Widget build(BuildContext context) {
    return Container(height: h*0.33, width:w,decoration:BoxDecoration( color:Colors.blue[50],boxShadow: [
      BoxShadow(
        color: Colors.grey[400],
        offset: Offset(0, -3),
      ),]),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: w*0.05),
        child:RichText(
          maxLines:4,
          text: TextSpan(
          style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey[800]),
          children: spans,
        ))
        //child: Text(sentence,  style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey[800]), maxLines: 6,),
      ));
  }
}