import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';


class ScrollingWidget extends StatefulWidget {
  const ScrollingWidget({
    Key key,
    @required this.scrollData,
    this.height
  }) : super(key: key);

  final List<List<Widget>> scrollData;
  final double height;

  @override
  _ScrollingWidgetState createState() => _ScrollingWidgetState();
}

class _ScrollingWidgetState extends State<ScrollingWidget> {
  @override
  Widget build(BuildContext context) {
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
        height: MediaQuery.of(context).size.height * 0.11,
        width: MediaQuery.of(context).size.width * 0.8,
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
