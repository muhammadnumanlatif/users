import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:users/assistants/assitant_methods.dart';
import 'package:users/authentication/login_screen.dart';
import 'package:users/global/global.dart';
import 'package:users/splashScreen/splash_screen.dart';
import 'package:users/widgets/cutom_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

@override
  void initState() {
    AssistantMethods.readCurrentOnlineUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: kGooglePlex,
            onMapCreated: (GoogleMapController kController){
                controller.complete(kController);
                newGoogleMapController = kController;

                //for black Theme
                blackThemeGoogleMap();
            },
          )
        ],
      ),
    );
  }
}
