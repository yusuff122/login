import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/bloc/app_bloc.dart';
import 'package:login/ui/screens/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.black));
  late final FirebaseApp app;
  late final FirebaseAuth auth;
  WidgetsFlutterBinding.ensureInitialized();

  try {
    app = await Firebase.initializeApp(
        options: FirebaseOptions(
        apiKey: '',
        appId: '',
        messagingSenderId: '',
        projectId: ''
        ));
    auth = FirebaseAuth.instanceFor(app: app);
    log(app.name);

  } catch (e) {
    log(e.toString());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: Sizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'new proje',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
