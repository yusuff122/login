import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/app_bloc.dart';
import 'package:login/consts/textStyles.dart';
import 'package:login/ui/screens/home_page.dart';
import 'package:sizer/sizer.dart';
import 'package:login/controller/email_and_password_controller.dart';

class LoginTextfieldButton extends StatelessWidget {
  const LoginTextfieldButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 25.sp, right: 25.sp, bottom: 20.sp, top: 20.sp),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyles.textFormFieldHintTextStyle(context),
                  icon: Icon(
                    Icons.alternate_email,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 25.sp, right: 25.sp, bottom: 25.sp),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyles.textFormFieldHintTextStyle(context),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black45,
                  ),
                ),
                obscureText: true,
              ),
            ),
            BlocListener<AppBloc, AppState>(
              listener: (context, state) {
              
              },
              child: Container(
                decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 202, 232, 123),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: TextButton(
                  onPressed: ()async {
                     context.read<AppBloc>().add(
                          AppEventLogIn(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                        log(emailController.text +" "+passwordController.text);
                        log(state.succeful.toString());
                          if (state is AppStateLoggedIn && state.succeful) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else if (state is AppStateLoggedIn && !state.succeful) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email veya şifre hatalı!')),
                  );
                }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle( fontSize: 16.sp),
                  ),
                ),
                width: 76.w,
                height: 6.h,
              ),
            ),
          ],
        );
      },
    );
  }
}
