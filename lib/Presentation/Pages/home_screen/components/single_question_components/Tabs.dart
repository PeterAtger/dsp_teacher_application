import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class TabFrame extends StatelessWidget {
  const TabFrame({
    Key key,
    @required this.size,
    this.tap,
    this.widget,
  }) : super(key: key);

  final Size size;
  final String tap;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.35,
      width: size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: tap == '1'
            ? BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )
            : BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                // bottomLeft: Radius.circular(8),
              ),
        color: AppColors.cWhite,
      ),
      child: widget,
    );
  }
}
