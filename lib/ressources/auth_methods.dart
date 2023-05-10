import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign in with google
  Future<String> signInWithGoogle() async {
    String res = "some error occurred";

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await _auth.signInWithCredential(credential);
      res = "success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  //sign up with username, email and password
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    //required Uint8List file,
  }) async {
    String res = "some error occured";

    try {
      //add file non null check later
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        //create user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //add user to firestore
        await _firestore.collection("users").doc(cred.user!.uid).set({
          "email": email,
          "username": username,
          //"profile_pic": file,
          "uid": cred.user!.uid,
          "followers": [],
          "following": [],
          "posts": [],
          "bio": "",
          "name": "",
        });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Sign in with email and password
  Future<String> signInUser(
      {required String email, required String password}) async {
    String res = "some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // Sign in user
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}

void handleAuthResult(
    String authResult, Widget destinationPage, BuildContext context) {
  String message;

  // auth success
  if (authResult == "success") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationPage),
    );
  }

  // auth failure TO DO
  switch (authResult) {
    case 'ERROR_INVALID_EMAIL':
      message = 'The email address is not valid.';
      break;
    case 'ERROR_WRONG_PASSWORD':
      message = 'The password is incorrect.';
      break;
    case 'ERROR_USER_NOT_FOUND':
      message = 'The user does not exist.';
      break;
    default:
      message = 'An undefined Error happened.';
  }

  //notify auth failure w/ appropriate message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
