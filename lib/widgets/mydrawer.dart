import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:users/global/global.dart';
import 'package:users/splashScreen/splash_screen.dart';

import 'custom_drawer_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key, this.name, this.email}) : super(key: key);
final String? name;
final String? email;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 16.5.h,
            color: Colors.black,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.amber),
              child: Row(
                children: [
                  Icon(
                      Icons.person,
                  size: 40.sp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 1.6.w,),
                  Column(
                    children: [
                      Text(widget.name.toString(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text(widget.email.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 1.2.h,),

          CustomDrawerTile(
            function: (){},
            text: "History",
            icon: Icons.history,
          ),

          CustomDrawerTile(
            function: (){},
            text: "Visit Profile",
            icon: Icons.person,
          ),

          CustomDrawerTile(
            function: (){},
            text: "About",
            icon: Icons.info,
          ),
          CustomDrawerTile(
            function: (){
              firebaseAuth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MySplashScreen()));
            },
            text: "Sign Out",
            icon: Icons.logout,
          ),

        ],
      ),
    );
  }
}
