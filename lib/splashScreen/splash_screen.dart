import 'dart:async';


import 'package:flutter/material.dart';

import '../assistants/assitant_methods.dart';
import '../authentication/login_screen.dart';
import '../global/global.dart';
import '../mainScreens/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  startTimer(){
   firebaseAuth!=null? AssistantMethods.readCurrentOnlineUserInfo():null;

    Timer(const Duration(seconds: 3), () async{

      if(await firebaseAuth.currentUser !=null){
        currentFirebaseUser= firebaseAuth.currentUser;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
      }
      //send to home screen

    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: "logo",
                  child: Image.asset("images/logo.png")),
             const Text("Users App",
              style: TextStyle(
                fontSize: 20,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
