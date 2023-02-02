
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../firebase_service/firebase_service.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/cutom_button.dart';
import '../widgets/progress_dialog.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  @override
  void dispose() {
    nameController!.dispose();
    emailController!.dispose();
    phoneController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  validateForm() {
    if (nameController!.text.length < 3) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Name must be atleast 3 Charachters long");
    } else if (!emailController!.text.contains('@') ||
        emailController!.text.isEmpty) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Email address is not valid.");
    } else if (phoneController!.text.isEmpty) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Phone no. is mandatory.");
    } else if (passwordController!.text.length < 6) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Password must be atleast 6 characters");
    } else {
      saveUserInfoNow();
    }
  }

  saveUserInfoNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            msg: 'Processing, Please wait...',
          );
        });

    FirebaseServices().createSaveAuthData(
      context,
      emailController!.text.trim(),
      passwordController!.text.trim(),
      phoneController!.text.trim(),
      nameController!.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(1.6.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(2.5.w),
                child:
                    Hero(tag: "logo", child: Image.asset("images/logo.png")),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              Text(
                "Resgister as a User",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                nameController: nameController,
                label: "Name",
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomTextField(
                nameController: emailController,
                label: "Email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomTextField(
                nameController: phoneController,
                label: "Phone",
                textInputType: TextInputType.phone,
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomTextField(
                nameController: passwordController,
                label: "Password",
                isObsucreType: true,
              ),

              SizedBox(
                height: 2.h,
              ),
              //button
              CustomButton(
                text: "Create Account",
                function: () {
                  validateForm();
                },
              ),
              CustomTextButton(
                text: "Already have an Account? Login Here",
                function: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
