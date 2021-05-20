import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class GreyLine extends StatelessWidget {
  const GreyLine({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 8,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.cLightGrey,
        ),
      ),
    );
  }
}
