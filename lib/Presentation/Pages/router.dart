import 'package:dsp_teacher_application/Presentation/Pages/how_it_works/HIW.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HIW());
      default:
        return MaterialPageRoute(builder: (_) => HIW());
    }
  }
}
