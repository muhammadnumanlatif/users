import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({Key? key, this.msg}) : super(key: key);
final String? msg;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.amber,
      child: Container(
        margin: EdgeInsets.all(1.4.w),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Padding(padding: EdgeInsets.all(1.6.w),
        child: Row(
          children: [
            SizedBox(width: 6.0.w,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
            SizedBox(width: 2.6.w,),
            Text(msg!,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 17.sp
            ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
