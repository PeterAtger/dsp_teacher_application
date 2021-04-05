import 'package:dsp_teacher_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/NavBar.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_teacher_application/Presentation/Global_components/ArabicImage.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/ActiveHours.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/FromTo.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/SettingsToggle.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/TeacherTimeSettings.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: DiffNavBar(),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          ArabicImage(
            top: -size.height / 3,
            right: -size.height / 3,
            size: size.height / 1.5,
            blendMode: BlendMode.srcATop,
            opacity: 0.1,
          ),
          Column(
            children: [
              SizedBox(height: 72),
              TitleBar(
                title: 'Notifications',
              ),
              SizedBox(height: 56),
              SettingsToggle(
                size: size,
                spacing: 32,
                toggleText: 'Push Notifications',
              ),
              SizedBox(height: 32),
              GradientLine(size: size),
              SizedBox(height: 8),
              SettingsToggle(
                spacing: 80,
                toggleText: 'New Queries',
                size: size,
              ),
              SizedBox(height: 8),
              SettingsToggle(
                size: size,
                spacing: 80,
                toggleText: 'New Updates',
              ),
              SizedBox(height: 40),
              ActiveHours(),
              SizedBox(height: 32),
              GradientLine(size: size),
              SizedBox(height: 8),
              FromToPanda(),
              SizedBox(height: 8),
              TeacherTimeSettings(),
              SizedBox(height: 8),
              Center(
                child: Text(
                    'Time where you want to recieve questions notifications',
                    style: AppFonts.captionText
                        .copyWith(color: AppColors.cLightGrey)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
