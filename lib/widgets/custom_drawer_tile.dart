import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomDrawerTile extends StatelessWidget {
  const CustomDrawerTile({
    Key? key, this.text, this.icon, this.function,
  }) : super(key: key);
  final String? text;
  final IconData? icon;
  final VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ListTile(
        leading: Icon(icon,color: Colors.amber,),
        title: Text(
          text!,
          style: TextStyle(
            color: Colors.amber,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
