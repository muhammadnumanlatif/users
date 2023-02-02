import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key, this.text, this.function,
  }) : super(key: key);
  final String? text;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(text!,
        style: TextStyle(
          color: Colors.amber,
          fontSize: 18.sp,
        ),
      ),
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all(Colors.amber),
      ),
    );
  }
}


