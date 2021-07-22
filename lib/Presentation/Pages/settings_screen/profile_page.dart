import 'dart:io';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_teacher_application/Data/repositries/answered_questions/answered_questions.dart';
import 'package:dsp_teacher_application/Data/repositries/saved_question/saved_question.dart';
import 'package:dsp_teacher_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_teacher_application/Logic/profile_data/profile_data_cubit.dart';
import 'package:dsp_teacher_application/Logic/profile_image/profile_image_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Pages/settings_screen/local_components/TeacherProfileInf.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:dsp_teacher_application/Presentation/global_components/GradientLine.dart';
import 'package:dsp_teacher_application/Presentation/global_components/TitleBar.dart';
import 'package:dsp_teacher_application/Presentation/translations/lokale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_components/QuestionButton.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // Body
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileImageCubit>(
            create: (BuildContext context) => ProfileImageCubit(),
          ),
        ],
        child: BlocConsumer<ProfileDataCubit, ProfileDataState>(
          listener: (context, state) {
            print('Something Got changed, here is the State: $state');
          },
          builder: (context, state) {
            return Stack(
              children: [
                // Upper colored Box
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
                // Image
                Positioned(
                  right: -size.height / 3,
                  top: -size.height / 3,
                  child: Container(
                    width: size.height / 1.5,
                    height: size.height / 1.5,
                    child: BlendMask(
                        blendMode: BlendMode.saturation,
                        opacity: 1,
                        child: Image.asset(
                            'lib/Presentation/Images/ArabicCircle.png')),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 72),
                    TitleBar(
                      title: LocaleKeys.Profile.tr(),
                      isTitleColorWhite: true,
                    ),
                    SizedBox(height: 16),
                    // Profile Image
                    BlocBuilder<ProfileImageCubit, ProfileImageState>(
                      builder: (context, imageState) {
                        return InkWell(
                          onLongPress: () {
                            context.read<ProfileImageCubit>().onButtonClick();
                          },
                          child: Center(
                            child: imageState.imagePath != null
                                ? Container(
                                    height: size.height / 10,
                                    width: size.height / 10,
                                    child: Image.file(
                                      File(imageState.imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : Container(
                                    height: size.height / 10,
                                    width: size.height / 10,
                                    decoration: BoxDecoration(
                                      color: AppColors.cWhite,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    Center(
                      child: Text(
                        state.fullName != null ? state.fullName : ' Debug mode',
                        style:
                            AppFonts.heading6.copyWith(color: AppColors.cWhite),
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
                          field1: '${LocaleKeys.Email.tr()} :',
                          field2: state.email != null
                              ? state.email
                              : 'Email@email.com',
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TeacherProfileInf(
                          field1: '${LocaleKeys.Expertise.tr()} :',
                          field2: state.expertise != null
                              ? state.expertise.toString().split('.').last
                              : ' Tester',
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TeacherProfileInf(
                          field1: '${LocaleKeys.Score.tr()} :',
                          field2: state.rating != null
                              ? state.rating.toString()
                              : '3',
                        ),
                        SizedBox(height: 32),
                        GradientLine(size: size),
                        SizedBox(height: 16),
                        QuestionButton(
                          onPress:
                              context.read<NavbarCubit>().goToAnsweredQuestions,
                          size: size,
                          text:
                              '${LocaleKeys.AnsweredQuestions.tr()} : ${AnsweredQuestionsData.listOfAnswers != null ? AnsweredQuestionsData.listOfAnswers.length : '-'}',
                          green: false,
                        ),
                        SizedBox(height: 16),
                        QuestionButton(
                          onPress:
                              context.read<NavbarCubit>().goToSavedQuestions,
                          size: size,
                          text:
                              '${LocaleKeys.WaitingQuestion.tr()} : ${SavedQuestionsData.savedQuestionsIds != null ? SavedQuestionsData.savedQuestionsIds.length : '-'}',
                          green: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
