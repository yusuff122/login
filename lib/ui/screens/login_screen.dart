import 'package:flutter/material.dart';
import 'package:login/ui/widgets/login_widgtes/login_image_text.dart';
import 'package:login/ui/widgets/login_widgtes/login_text_icon.dart';
import 'package:login/ui/widgets/login_widgtes/login_textfield_button.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          LoginImageText(),
          LoginTextfieldButton(),
          SizedBox(height: 2.h,),
          LoginTextIcon()
        ],
      ),
    );
  }
}