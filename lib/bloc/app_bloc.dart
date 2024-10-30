import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login/data/repositories/auth_repository.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppStateLogOut(isLoading: true, succeful: false)) {

    on<AppEventLogIn>((event, emit) async{
      emit(AppStateLogOut(isLoading: true, succeful: false));
      try {
        await AuthRepository().signInEmailAndPassword(email: event.email, password: event.password);
        emit(AppStateLoggedIn(isLoading: false, succeful: true));
      } on FirebaseAuthException catch (e) {
        log(e.toString());
        emit(AppStateLoggedIn(isLoading: false, succeful: false));
      }
    });

    on<AppEventLogOut>((event, emit) async{
      await AuthRepository().signOut();
      emit(AppStateLogOut(isLoading: true, succeful: false));
      try {
        emit(AppStateLogOut(isLoading: false, succeful: true));
      } on FirebaseAuthException catch (e) {
        log(e.toString());
      }
    });

     on<AppEventregister>((event, emit) async{
      
      await AuthRepository().createUserEmailAndPassword(email: event.email, password: event.password, name: event.name_surname, bloodGroup: event.bloodGroup, city: event.city);
      emit(AppStateLoggedIn(isLoading: true, succeful: false));
      try {
        emit(AppStateLogOut(isLoading: false, succeful: true));
      } on FirebaseAuthException catch (e) {
        log(e.toString());
      }
    });
    
      on<AppEventResetPassword>((event, emit) async{
      
      await AuthRepository().sendResstEmailAndPassword(email: event.email);
      emit(AppStateLoggedIn(isLoading: true, succeful: false));
      try {
        emit(AppStateLogOut(isLoading: false, succeful: true));
      } on FirebaseAuthException catch (e) {
        log(e.toString());
      }
    });

    on<AppEventLogInWithGoogle>((event, emit) async {
      emit(AppStateLoggedIn(isLoading: true, succeful: false));

      try {
        final user = await AuthRepository().signInWithGoogle();
        if (user != null) {
          emit(AppStateLoggedIn(isLoading: false, succeful: true));
        } else {
          emit(AppStateLogOut(isLoading: false, succeful: true));
        }
      } catch (e) {
       // emit(AppStateError(message: e.toString()));
       log(e.toString());
      }
    });

  }
}
