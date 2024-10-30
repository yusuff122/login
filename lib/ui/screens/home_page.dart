import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/app_bloc.dart';
import 'dart:developer';

import 'package:login/ui/screens/login_screen.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state is AppStateLogOut && state.succeful) {
          log("Çıkış başarılı");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
        // Kullanıcı çıkış yapmaya çalışırken bir yükleme durumu varsa
        if (state is AppStateLogOut && state.isLoading) {
          // Yükleme göstergesi (isteğe bağlı)
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: () {
              context.read<AppBloc>().add(AppEventLogOut());
            },
            child: Text("Çıkış yap"),
            color: Colors.red, // Düğmenin arka plan rengi
            textColor: Colors.white, // Düğmedeki yazı rengi
          ),
        ),
      ),
    );
  }
}
