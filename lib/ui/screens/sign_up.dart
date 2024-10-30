import 'package:flutter/material.dart';
import 'package:login/consts/textStyles.dart';
import 'package:login/ui/widgets/sign_up_widgets/sign_up_textfields.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Set up your account",style: TextStyles.signUpAppbarTextStyle(context),),
      ),
      body: ListView(
        children: [
           Padding(
             padding:  EdgeInsets.only(left: 38.sp,right: 26.sp,top: 20.sp),
             child: Text("Please complete all information to"),
           ),
           Padding(padding: EdgeInsets.only(left: 41.sp,right: 34.sp),
             child: Text("create your account on xxx"),
           ),
           SizedBox(height: 3.h,),
           SignUpTextfields()         
      ],),
    );
  }
}