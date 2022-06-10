

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationManager {
  final FirebaseAuth _firebaseAuth;
  AuthenticationManager(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> logOutUser() async{
    await _firebaseAuth.signOut();
  }

  Future<String?> logInUser(
      {required String email,  required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Logged in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> SignUpUser(
      {required String email,  required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password,);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
     _firebaseAuth.signInWithCredential(credential);

}

