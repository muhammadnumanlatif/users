import 'package:firebase_database/firebase_database.dart';
import 'package:users/global/global.dart';
import 'package:users/models/user_model.dart';

class AssistantMethods{
  static void readCurrentOnlineUserInfo()async{
    currentFirebaseUser = firebaseAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance
        .ref()
        .child("users").child(currentFirebaseUser!.uid);
    userRef.once().then((snap){
      if(snap.snapshot.value!=null){
       userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
       print("name: " + userModelCurrentInfo!.name.toString());
       print("email: " + userModelCurrentInfo!.email.toString());


      }
    });
  }
}