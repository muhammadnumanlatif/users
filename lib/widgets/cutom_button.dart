import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, this.text, this.function,
  }) : super(key: key);
  final String? text;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(text!,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
      ),
    );
  }
}


