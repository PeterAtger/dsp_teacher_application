import 'package:flutter/material.dart';

enum Expertise { Fresh, OnetoFive, AboveFive }

class ProfileData {
  String name;
  String email;
  Image profilePicture;
  Expertise expertise;
  String score;
  int solvedQuestions;
  int waitingQuestions;
}
