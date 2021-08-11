import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker_demo/model/user.dart';
import 'package:weight_tracker_demo/services/firestore_services.dart';

///****************************************************
///*** Created by Fady Fouad on 20-Jul-21 at 19:09.***
///****************************************************

class AuthenticateService {
  // sign in with Firebase (use anonymous sign-in for simplicity).
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //create new User with email&password
  Future signUpWithEmailANdPassword(
      String email, String password, String name, String url) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User loggedUser = result.user!;
      loggedUser.updateDisplayName(name);
      loggedUser.updatePhotoURL(url);
      DataBaseServices(uid: loggedUser.uid).updateUserData(
          id: loggedUser.uid,
          name: name,
          email: email,
          photoURL: url,
          date: loggedUser.metadata.creationTime,
          type: 1);
      return _userFromFireBase(loggedUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailANdPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User loggedUser = result.user!;
      return loggedUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

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
    return user != null
        ? UserModel(
            uid: user.uid,
            name: user.displayName.toString(),
            type: UserType.ADMIN,
            createdDate: user.uid)
        : null;
  }

  Stream<UserModel?> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => _userFromFireBase(user!));
  }
}
