import 'package:dsp_teacher_application/Presentation/global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/BackGroundGradient.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacementNamed('/signIn');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.cWhite,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackGroundGradient(),
          ArabicImage(
              top: -150,
              bottom: null,
              left: -200,
              size: size.height / 1.5,
              opacity: 1),
          ArabicImage(
              bottom: -150,
              top: null,
              left: -200,
              size: size.height / 1.5,
              opacity: 1),
          Positioned(
              top: -size.height * 0.07,
              left: 0,
              child: Container(
                height: size.width * 1.8,
                width: size.width * 1.8,
                decoration: BoxDecoration(
                  color: AppColors.cWhite,
                  shape: BoxShape.circle,
                ),
              )),
          Positioned(
            top: size.height / 4,
            // left: size.width / 2 - size.width / 4,
            child: Container(
              height: 250,
              width: size.width,
              child: Lottie.asset('lib/Presentation/animations/shakkel.json',
                  repeat: false),
            ),
          ),
        ],
      ),
    );
  }
}
