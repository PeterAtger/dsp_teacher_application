import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class ScrollingWidget extends StatefulWidget {
  const ScrollingWidget({
    Key key,
    @required this.scrollData,
  }) : super(key: key);

  final List<List<Widget>> scrollData;

  @override
  _ScrollingWidgetState createState() => _ScrollingWidgetState();
}

class _ScrollingWidgetState extends State<ScrollingWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            color: AppColors.cWhite,
            border: Border.all(color: AppColors.cPurple, width: 2),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 3),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: AppColors.cLightGrey),
            ],
            borderRadius: BorderRadius.all(Radius.circular(36))),
        padding: EdgeInsets.all(8),
        height: 56,
        width: size.width * 0.8,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: ListWheelScrollView(
                onSelectedItemChanged: (s) {
                  print(s);
                },
                overAndUnderCenterOpacity: 0.2,
                itemExtent: 20,
                children: widget.scrollData[0],
              ),
            ),
            Container(
              height: 50,
              width: 50,
              child: ListWheelScrollView(
                onSelectedItemChanged: (s) {
                  print(s);
                },
                overAndUnderCenterOpacity: 0.2,
                itemExtent: 20,
                children: widget.scrollData[1],
              ),
            ),
            Container(
              height: 50,
              width: 50,
              child: ListWheelScrollView(
                onSelectedItemChanged: (s) {
                  print(s);
                },
                overAndUnderCenterOpacity: 0.2,
                itemExtent: 20,
                children: widget.scrollData[2],
              ),
            ),
          ],
        ));
  }
}
