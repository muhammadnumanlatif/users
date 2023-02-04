import 'package:flutter/cupertino.dart';
import 'package:users/models/directions.dart';

class AppInfo extends ChangeNotifier{
  Directions? userPickupLocation;
  void updatePickupLocationAddress(Directions userPickAddress){
    userPickupLocation =  userPickAddress;
    notifyListeners();
  }
}