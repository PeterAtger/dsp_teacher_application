import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/NavBar.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/QuestionButton.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/TeacherProfileInf.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/global_components/ArabicImage.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: DiffNavBar(),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Container(
            height: size.height / 3,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.cGreen, AppColors.cPurple]),
            ),
          ),
          ArabicImage(
            size: size.height / 1.5,
            top: -size.height / 3,
            right: -size.height / 3,
            opacity: 1,
          ),
          Column(
            children: [
              SizedBox(height: 48),
              TitleBar(
                title: 'Profile',
                isTitleColorWhite: true,
              ),
              SizedBox(height: 32),
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: AppColors.cWhite,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Habiba Ashraf',
                  style: AppFonts.heading3.copyWith(color: AppColors.cWhite),
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height / 3,
            child: Container(
              height: size.height * 2 / 3,
              width: size.width,
              decoration: BoxDecoration(color: AppColors.cWhite),
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  TeacherProfileInf(
                    field1: 'Email: ',
                    field2: 'Habiba.Ash@example.com',
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TeacherProfileInf(
                    field1: 'Expertise: ',
                    field2: '< 5 years',
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TeacherProfileInf(
                    field1: 'Score: ',
                    field2: 'Application Interactant',
                  ),
                  SizedBox(height: 32),
                  GradientLine(size: size),
                  SizedBox(height: 8),
                  QuestionButton(
                    size: size,
                    text: 'Solved Questions: 3',
                    green: false,
                  ),
                  SizedBox(height: 16),
                  QuestionButton(
                    size: size,
                    text: 'Waiting Questions: 3',
                    green: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
