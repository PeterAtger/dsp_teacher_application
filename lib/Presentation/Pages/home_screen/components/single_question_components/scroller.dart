import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Logic/main/chosen_choic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollingWidget extends StatefulWidget {
  const ScrollingWidget({
    Key key,
    @required this.scrollData,
    this.height,
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
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 72,
              width: 70,
              child: ListWheelScrollView(
                onSelectedItemChanged: (s) {
                  context.read<ChocenChoicCubit>().scrollChoice(s, 0);
                },
                overAndUnderCenterOpacity: 0.2,
                itemExtent: 48,
                children: widget.scrollData[0],
              ),
            ),
            Container(
              height: 72,
              width: 70,
              child: ListWheelScrollView(
                onSelectedItemChanged: (s) {
                  context.read<ChocenChoicCubit>().scrollChoice(s, 1);
                },
                overAndUnderCenterOpacity: 0.2,
                itemExtent: 48,
                children: widget.scrollData[1],
              ),
            ),
            Container(
              height: 72,
              width: 70,
              child: ListWheelScrollView(
                onSelectedItemChanged: (s) {
                  context.read<ChocenChoicCubit>().scrollChoice(s, 2);
                },
                overAndUnderCenterOpacity: 0.2,
                itemExtent: 48,
                children: widget.scrollData[2],
              ),
            ),
          ],
        ));
  }
}
