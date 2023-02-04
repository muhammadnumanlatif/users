import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:users/infoHandler/app_info.dart';

import 'firebase_options.dart';
import 'splashScreen/splash_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp(
    child:ResponsiveSizer(
      builder:  (context, orientation, screenType) {
        return ChangeNotifierProvider(
         create: (context)=>AppInfo(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Drivers App',
              theme: ThemeData(
                primarySwatch: Colors.amber,
                useMaterial3: true,
              ),
              home: const MySplashScreen(),

          ),
        );
      }
    )
  ));
}

class MyApp extends StatefulWidget {
  final Widget? child;

  const MyApp({super.key, required this.child});
static void restartApp(BuildContext context){
  context.findAncestorStateOfType<_MyAppState>()!.restartApp();
}
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
  }
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
        key: key,
        child: widget.child!,
    );
  }
}
