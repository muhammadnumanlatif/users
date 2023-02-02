import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../firebase_service/firebase_service.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/cutom_button.dart';
import '../widgets/progress_dialog.dart';
import 'signup_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  validateForm() {
    if (!emailController!.text.contains('@') ||
        emailController!.text.isEmpty) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Email address is not valida.");
    } else if (passwordController!.text.isEmpty) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 18.0.sp,
          msg: "Password must be atleast 6 characters");
    } else {
      loginUserNow();
    }
  }

  loginUserNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            msg: 'Processing, Please wait...',
          );
        });
    FirebaseServices().loginAuth(
        context,
      emailController!.text.trim(),
      passwordController!.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(2.w),
          child: Column(
            children: [
              SizedBox(height: 3.h,),
              Padding(padding: EdgeInsets.all(2.5.w),
                child:  Hero(
                    tag: "logo",
                    child: Image.asset("images/logo.png")),
              ),
              SizedBox(height: 1.0.h,),
              Text("Login as a User",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                nameController: emailController,
                label: "Email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 1.h,),
              CustomTextField(
                nameController: passwordController,
                label: "Password",
                isObsucreType: true,
              ),
              SizedBox(height: 2.h,),
              //button
              CustomButton(
                text: "Login",
                function: (){
                   validateForm();
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>CarInfoScreen()));
                },
              ),
              CustomTextButton(
                text:"Do not have an Account? Register Here",
                function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
