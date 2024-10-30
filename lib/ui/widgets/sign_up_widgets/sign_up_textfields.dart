import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/bloc/app_bloc.dart';
import 'package:login/consts/textStyles.dart';
import 'package:login/controller/dropdown_button_controller.dart';
import 'package:login/controller/email_and_password_controller.dart';
import 'package:login/ui/screens/home_page.dart';
import 'package:login/ui/screens/login_screen.dart';
import 'package:sizer/sizer.dart';

class SignUpTextfields extends StatelessWidget {
  const SignUpTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(12.sp),

      child: Column(
        children: [
          TextFormField(
            controller: nameControllerSignUp,
                  decoration: InputDecoration(
                    hintText: 'Name, surname',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(19.sp),
                    ),
                    hintStyle: TextStyles.textFormFieldHintTextStyle(context),
                    
                  ),
                 
                ),
                SizedBox(height: 2.h,),
             TextFormField(
              controller: emailControllerSignUp,
                  decoration: InputDecoration(
                    hintText: 'Email',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(19.sp),
                    ),
                    hintStyle: TextStyles.textFormFieldHintTextStyle(context),
                   
                  ),
                
                ),
                SizedBox(height: 2.h,),
               TextFormField(
                controller: passwordControllerSignUp,
                  decoration: InputDecoration(
                    hintText: 'Password',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(19.sp),
                    ),
                    hintStyle: TextStyles.textFormFieldHintTextStyle(context),
                    suffixIcon: Icon(Icons.visibility_off)
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 2.h,),
                TextFormField(
                  controller: passwordAgainControllerSignUp,
                  decoration: InputDecoration(
                    hintText: 'password again',
                    border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(19.sp),
                    ),
                    hintStyle: TextStyles.textFormFieldHintTextStyle(context),
                    suffixIcon: Icon(Icons.visibility_off),
                    
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 2.h,),
             DropdownButtonFormField<String>(
                      value: selectedbloodGruops,
                      decoration: InputDecoration(
                        hintText: 'Kan grubunuzu seçin',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19.sp),
                        ),
                        hintStyle: TextStyles.textFormFieldHintTextStyle(context),
                        suffixIcon: Icon(Icons.location_city, color: Colors.black),
                      ),
                      items: bloodGroups.map((bloodGroup) {
                      return DropdownMenuItem(
                        value: bloodGroup,
                         child: Text(bloodGroup),
                        );
                      }).toList(),
                      onChanged: (value) {
                          selectedbloodGruops = value.toString();
                          
                       },
                     ),
                SizedBox(height: 2.h,),
                  DropdownButtonFormField<String>(
                      value: selectedCity,
                      decoration: InputDecoration(
                        hintText: 'Şehir seçin',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19.sp),
                        ),
                        hintStyle: TextStyles.textFormFieldHintTextStyle(context),
                        suffixIcon: Icon(Icons.location_city, color: Colors.black),
                      ),
                      items: cities.map((city) {
                      return DropdownMenuItem(
                        value: city,
                         child: Text(city),
                        );
                      }).toList(),
                      onChanged: (value) {
                          selectedCity = value.toString();
                       },
                     ),

                SizedBox(height: 12.h,),
               Container(
                decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 202, 232, 123),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: TextButton(
                  onPressed: ()async {
                     log(selectedbloodGruops.toString());
                        if(emailControllerSignUp.text == "" || passwordControllerSignUp.text ==""){
                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(content: Text('Lütfen boş alanları doldurun')),
                            );
                        }else{
                           context.read<AppBloc>().add(
                          AppEventregister(email: emailControllerSignUp.text,
                           password: passwordControllerSignUp.text, 
                           name_surname: nameControllerSignUp.text
                           ,bloodGroup: selectedbloodGruops.toString(), 
                           city: selectedCity.toString()));
                          
                          FirebaseAuth.instance.authStateChanges().listen((User? user )
                             {
                                 if(user == null){
                                    log("kayıt başarısız");
                                 }
                                 else{
                                  log(user.email.toString());
                                   Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage(),));
                                 }
                             }
                          );
                        }
                  },
                  child: Text(
                    "Create account",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                width: 76.w,
                height: 6.h,
              ),
              SizedBox(height: 3.h,),
                   SizedBox(height: 3.h,),
                      Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If you already have an account,",style: TextStyles.loginWithSignUpTextStyle(context),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => LoginScreen(),));
                       
                      },
                      child: Text("Log in",style: TextStyles.loginRegisterTextStyle(context),),
                    ),
                  ],
                ),
               
        ],
      ),
    );
  }
}