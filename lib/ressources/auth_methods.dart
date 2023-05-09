import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
