import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign in with google
  Future<String> signInWithGoogle() async {
    String res = "success";

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

    return res;
  }

  //sign up with username, email and password
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    //required Uint8List file,
  }) async {
    String res = "Please fill all fields";

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
    String res = "Please fill all fields";
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
    HapticFeedback.heavyImpact();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationPage),
    );
  } else {
    // auth failure - set message
    switch (authResult) {
      case 'Please fill all fields':
        message = 'Please fill all fields.';
        break;
      case '[firebase_auth/invalid-email] The email address is badly formatted.':
        message = 'The email address is not valid.';
        break;
      case '[firebase_auth/weak-password] Password should be at least 6 characters':
        message = 'The password needs a least 6 characters.';
        break;
      case '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.':
        message = 'The user does not exist.';
        break;
      default:
        message = 'An Error happened.';
    }

    //notify auth failure w/ appropriate message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(message,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
