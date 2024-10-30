import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/consts/textStyles.dart';
import 'package:sizer/sizer.dart';

class LoginImageText extends StatefulWidget {
  const LoginImageText({super.key});

  @override
  State<LoginImageText> createState() => _LoginImageTextState();
}

class _LoginImageTextState extends State<LoginImageText> {
  @override
  Widget build(BuildContext context) {
    return  Column(
   //   crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.h,),
    
Container(
  width: double.infinity,
  height: 70.sp, 
  child: Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(
        'assets/images/image1.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Positioned.fill(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), 
          child: Container(
            color: Colors.transparent, 
          ),
        ),
      ),
    ],
  ),
),
 
      Padding(
        padding:  EdgeInsets.only(right: 63.sp),
        child: Text("Login",style: TextStyles.loginTextStyle(context),),
      )
      ],
    );
  }
}