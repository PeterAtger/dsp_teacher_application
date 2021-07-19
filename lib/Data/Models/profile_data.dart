import 'package:flutter/material.dart';

enum Expertise { Fresh, OnetoFive, AboveFive }

class ProfileDataModel {
  String name;
  String email;
  Image profilePicture;
  Expertise expertise;
  String score;
  int solvedQuestions;
  int waitingQuestions;
}
