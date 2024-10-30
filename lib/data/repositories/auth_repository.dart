
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/bloc/app_bloc.dart';

class AuthRepository{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late  GoogleSignIn _googleSignIn= GoogleSignIn();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();


  Future<void> signInEmailAndPassword({
    required String email,
    required String password,
  })async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  } 
   

  Future<void> createUserEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String bloodGroup,
    required String city,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
     
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'bloodGroup': bloodGroup,
        'city': city,
        'email': email,
        'password': password
      });

      print('Kullanıcı başarıyla kaydedildi.');
    } on FirebaseAuthException catch (e) {
      log('Kayıt hatası: ${e.message}');
    } catch (e) {
      log('Beklenmedik bir hata oluştu: $e');
    }
  }

  Future<void> sendResstEmailAndPassword({
    required String email,
    
  })async{
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  } 
  
  
  Future<User?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
    log(userCredential.user!.email.toString());
    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

}

