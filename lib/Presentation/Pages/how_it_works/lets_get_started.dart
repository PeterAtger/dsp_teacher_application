import 'package:dsp_teacher_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_teacher_application/Presentation/global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Pages/how_it_works/components/GradientHeading.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: <Widget>[
      // Background Image
      ArabicImage(
        bottom: -size.height / 3,
        left: -size.height / 3,
        size: size.height / 1.5,
        opacity: 0.05,
        blendMode: BlendMode.srcATop,
      ),

      // Icon and Text
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height / 5,
          ),
          GradientHeading(
            text: 'Let\'s get started',
          ),
          SizedBox(
            height: size.height / 5,
          ),
          Container(
            height: 80,
            width: 80,
            child: FloatingActionButton(
                focusColor: AppColors.cDarkGrey,
                elevation: 2,
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 250), () {
                    context.read<NavbarCubit>().goToHome();
                    Navigator.of(context).pushReplacementNamed('/MainScreen');
                  });
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.cWhite,
                )),
          )
        ],
      ),
    ]));
  }
}
