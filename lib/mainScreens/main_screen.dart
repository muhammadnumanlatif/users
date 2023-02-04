
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:users/assistants/assitant_methods.dart';
import 'package:users/authentication/login_screen.dart';
import 'package:users/global/global.dart';
import 'package:users/infoHandler/app_info.dart';
import 'package:users/mainScreens/search_places_screen.dart';
import 'package:users/splashScreen/splash_screen.dart';
import 'package:users/widgets/custom_text_button.dart';
import 'package:users/widgets/cutom_button.dart';
import 'package:users/widgets/mydrawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  double searchLocationContainerHeight = 35.0.h;



@override
  void initState() {
    super.initState();
    checkIfLocationPermissionAllowed();
  }

  locateUserPosition()async{
    Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;
    LatLng latLngPosition = LatLng(
      userCurrentPosition!.latitude,
      userCurrentPosition!.longitude,
    );
    CameraPosition cameraPosition = CameraPosition(target: latLngPosition,zoom: 14);
    newGoogleMapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    String hra=await AssistantMethods.searchAddressForGeographicCoordinate(userCurrentPosition!,context);
    print("this is your address:-$hra" );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: sKey,
        drawer: SizedBox(
          width: 75.w,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black
            ),
            child: MyDrawer(
              name: userModelCurrentInfo!.name,
            email: userModelCurrentInfo!.email,
            ),
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
                mapType: MapType.normal,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController kController){
                  controller.complete(kController);
                  newGoogleMapController = kController;

                  //for black Theme
                  blackThemeGoogleMap();

                  //USER POSITION
                locateUserPosition();
              },
            ),
            //custom hamburger button
            Positioned(
                top:36,
                left: 22,
                child: GestureDetector(
                  onTap: (){
                    sKey.currentState!.openDrawer();
                  },
                  child:const CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ),
            ),

            //UI FOR SEARCHING
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedSize(
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 120),
                  child: Container(
                    height: searchLocationContainerHeight,
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),

                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.4.w,
                      vertical: 1.8.w,
                      ),
                      child: Column(
                        children: [
                          //from
                          Row(
                            children: [
                              const Icon(Icons.add_location_alt_outlined,
                              color: Colors.black,
                              ),
                              SizedBox(width: 1.2.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    Provider.of<AppInfo>(context).userPickupLocation != null
                                        ? (Provider.of<AppInfo>(context).userPickupLocation!.locationName!).substring(0,25)+"..."
                                        : "not getting address",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.6.h,),
                          Divider(
                            color: Colors.black,
                            height: 2.h,
                          thickness: 1,
                          ),
                          SizedBox(height: 1.6.h,),
                          //to
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPlacesScreen()));
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.add_location_alt_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 1.2.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "To",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Where to Go?",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.6.h,),
                          Divider(
                            color: Colors.black,
                            height: 2.h,
                            thickness: 1,
                          ),
                          SizedBox(height: 1.6.h,),
                          CustomButton(
                            text: "Request a Ride",
                            function: (){},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
