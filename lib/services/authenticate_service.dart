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
      {required String email, required String password, required String displayName, required String photoURL}) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User createdUser = result.user!;
      createdUser.updateDisplayName(displayName);
      createdUser.updatePhotoURL(photoURL);
      DataBaseServices(uid: createdUser.uid).updateUserData(
          uid: createdUser.uid,
          displayName: displayName,
          email: email,
          phoneNumber: '',
          photoURL: photoURL,
          creationTime: createdUser.metadata.creationTime,
          type: 1);
      return createdUser;
    } catch (e) {
      print(e.toString());
      print("NULLL");
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
            displayName: user.displayName.toString(),
            type: UserType.ADMIN,
            creationTime: user.metadata.creationTime!,
            email: user.email!,
            phoneNumber: user.phoneNumber == null ? '' : user.phoneNumber!,
            photoURL: '')
        : null;
  }

  Stream<UserModel?> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => _userFromFireBase(user!));
  }
}
