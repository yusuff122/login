import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextStyles{

  static TextStyle loginTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold
    );
  }
    static TextStyle textFormFieldHintTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 16.sp,
      color: Colors.black45
    );
  }

  static TextStyle loginWithTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 16.sp,
      color: Colors.black45
    );
  }

   static TextStyle loginWithSignUpTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 16.sp,
      color: Colors.black45
    );
  }
  static TextStyle loginRegisterTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 16.sp,
      color: Colors.blue.shade800,
      fontWeight: FontWeight.bold
    );
  }
  
  static TextStyle signUpAppbarTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 18.sp,
     // color: Colors.blue.shade800,
      fontWeight: FontWeight.bold
    );
  }
  
}