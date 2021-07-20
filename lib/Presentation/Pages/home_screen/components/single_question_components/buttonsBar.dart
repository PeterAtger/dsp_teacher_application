import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Apply",
                    style: AppFonts.bodyText1.copyWith(color: Colors.white)),
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
                onPressed: () {},
                icon: SvgPicture.asset(
                  'lib/Presentation/Images/yellow_star.svg',
                  height: 24,
                  width: 24,
                ),
                label: Text("Save",
                    style: AppFonts.bodyText1
                        .copyWith(color: AppColors.cDarkGrey)),
                style: ButtonStyle(
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
