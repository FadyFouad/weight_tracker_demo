import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker_demo/model/user.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 19:09.***
///****************************************************

class AuthenticateService {
  // sign in with Firebase (use anonymous sign-in for simplicity).
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInAnonymous() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User loggedUser = result.user!;
      return _userFromFireBase(loggedUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }


  UserModel? _userFromFireBase(User user) {
    return user != null ? UserModel(user.uid): null;
  }

  Stream<UserModel?> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => _userFromFireBase(user!));
  }
}
