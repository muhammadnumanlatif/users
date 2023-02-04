import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:users/global/global.dart';
import 'package:users/infoHandler/app_info.dart';
import 'package:users/models/directions.dart';
import 'package:users/models/user_model.dart';

import '../global/map_key.dart';
import 'request_asistance.dart';

class AssistantMethods {

  static Future<String>searchAddressForGeographicCoordinate(Position position, context)async{
    String apiUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";
    String humanReadableAddress = "";
    var requestResponse = await RequestAssistance.receiveRequest(apiUrl);
    if(requestResponse!="Error Occurred, Failed, No Response."){
          humanReadableAddress= requestResponse["results"][0]["formatted_address"];
          Directions userPickupAddress = Directions();
          userPickupAddress.locationLatitude =position.latitude;
          userPickupAddress.locationLongitude=position.longitude;
          userPickupAddress.locationName=humanReadableAddress;

          Provider.of<AppInfo>(context,listen: false).updatePickupLocationAddress(userPickupAddress);

    }
    return humanReadableAddress;
  }

  static void readCurrentOnlineUserInfo() async {
    currentFirebaseUser = firebaseAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(currentFirebaseUser!.uid);
    userRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
      }
    });
  }
}
