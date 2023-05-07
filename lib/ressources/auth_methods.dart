import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up with email and password
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    //required Uint8List file,
  }) async {
    String res = "some error occured";

    try {
      //add file non null check later
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
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
}
