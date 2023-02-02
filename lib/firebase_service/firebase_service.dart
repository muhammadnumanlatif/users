import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../global/global.dart';
import '../splashScreen/splash_screen.dart';

class FirebaseServices {
  createSaveAuthData(BuildContext context, String email, String password,
      String phone, String name) async {
    final User? firebaseUser = (await firebaseAuth
            .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Error: " + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      Map userMap = {
        "id": firebaseUser.uid,
        "name": name,
        "email": email,
        "phone": phone,
      };
      DatabaseReference userRef = firebaseDatabase.ref().child("users");
      userRef.child(firebaseUser.uid).set(userMap);
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Account has been created.");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MySplashScreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Account has not been created.");
    }
  }

  loginAuth(
    BuildContext context,
    String email,
    String password,
  ) async {
    final User? firebaseUser = (await firebaseAuth
            .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Error: " + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      DatabaseReference userRef = firebaseDatabase.ref().child("users");
      userRef.once().then((userKey) {
        final snap = userKey.snapshot;
        if (snap != null) {
          currentFirebaseUser = firebaseUser;
          Fluttertoast.showToast(
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              fontSize: 18.0.sp,
              msg: "Login Successfully.");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MySplashScreen()));
        } else {
          firebaseAuth.signOut();
          Fluttertoast.showToast(
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              fontSize: 18.0.sp,
              msg: "No record exist with this email.");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MySplashScreen()));
        }
      });
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Error occurred during login.");
    }
  }
}
