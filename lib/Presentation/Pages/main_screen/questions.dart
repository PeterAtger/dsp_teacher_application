import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:dsp_teacher_application/Presentation/Pages/main_screen/NavBar.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class questionss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    appBar: screenBar(),
    bottomNavigationBar: NavBar(),
    
    );
    }      
}


AppBar screenBar() {
   return AppBar(
     toolbarHeight:  120,
     backgroundColor: Colors.transparent,
    elevation: 0,
    title: AutoSizeText('Questions', style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey[800])),
    leading:   
       IconButton(icon: Image(image:Svg("assets/left-arrow.svg") ,color:AppColors.cDarkGrey[800] ,height: 24, width: 24,), onPressed: () => {}),  
   );
}