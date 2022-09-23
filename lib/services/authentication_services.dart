import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/user_model.dart';
import 'package:notes_app/screens/homescreen.dart';
import 'package:notes_app/utils/toast.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth;
  UserModel userModel = UserModel();
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");

  BuildContext navigatorContext;

  AuthenticationServices(this._firebaseAuth, this.navigatorContext);

  Future<void> logIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(navigatorContext).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));

      Toast.normal("Logged In");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Toast.error("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Toast.error("Wrong password provided for that user.");
      } else {
        Toast.error();
      }
    }
  }

  Future<void> signUp(
      {required String email,
      required String name,
      required String password,
      required DateTime timestamp}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      Navigator.of(navigatorContext)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));

      addUserToDB(
          uid: _firebaseAuth.currentUser!.uid,
          name: name,
          email: email,
          timestamp: timestamp);
      Toast.info("Signed Up");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Toast.error("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Toast.error("The account already exists for that email.");
      } else {
        Toast.error();
      }
    } catch (e) {
      Toast.error(e.toString());
    }
  }

  Future<void> addUserToDB(
      {required String uid,
      required String name,
      required String email,
      required DateTime timestamp}) async {
    userModel =
        UserModel(uid: uid, name: name, email: email, timestamp: timestamp);

    await userRef.add(UserModel().toMap(userModel));
  }
}
