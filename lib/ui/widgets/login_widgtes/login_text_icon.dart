import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/app_bloc.dart';
import 'package:login/consts/textStyles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/ui/screens/home_page.dart';
import 'package:login/ui/screens/sign_up.dart';
import 'package:sizer/sizer.dart';

class LoginTextIcon extends StatelessWidget {
  const LoginTextIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        log(state.succeful.toString());
        if (state is AppStateLoggedIn && state.succeful == true) {
          
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else if (state is AppStateLogOut) {
            log("giriş başarısız");
        }
      },
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Column(
            children: [
              Text("Or, login with...",
                  style: TextStyles.loginWithTextStyle(context)),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                      border: Border.all(strokeAlign: BorderSide.strokeAlignInside),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.read<AppBloc>().add(AppEventLogInWithGoogle());

                      },
                      icon: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.red, Colors.blue],
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                      border: Border.all(strokeAlign: BorderSide.strokeAlignInside),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                      border: Border.all(strokeAlign: BorderSide.strokeAlignInside),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.apple,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to iThickLogistics?",
                    style: TextStyles.loginWithSignUpTextStyle(context),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => SignUp(),));
                    },
                    child: Text(
                      "Register",
                      style: TextStyles.loginRegisterTextStyle(context),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
