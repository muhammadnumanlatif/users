import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:users/assistants/request_asistance.dart';
import 'package:users/widgets/custom_textfield.dart';

import '../global/map_key.dart';

class SearchPlacesScreen extends StatefulWidget {
  const SearchPlacesScreen({Key? key}) : super(key: key);

  @override
  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  TextEditingController? dropoffLocation = TextEditingController();
  @override
  void dispose() {
    dropoffLocation!.dispose();
    super.dispose();
  }

  void findPlaceAutoCompleteSearch(String inputText) async{
    if(inputText.length>1){
      String urlAutoCompleteSearch=
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$inputText&key=$mapKey&components=country:PK";
     var response= await RequestAssistance.receiveRequest(urlAutoCompleteSearch);
     if(response=="Error Occurred, Failed, No Response."){
       return;
     }
     print("this is response from api");
     print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding:  EdgeInsets.all(1.6.w),
          child: Column(
            children: [
              Container(
                height: 18.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber,
                      blurRadius: 8,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.amber,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Search & Set Dropoff Location",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.6.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(1.5.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.adjust_sharp,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 1.8.w,
                          ),
                          Expanded(
                            child: TextField(
                              controller: dropoffLocation,
                              onChanged: (value) {
                                findPlaceAutoCompleteSearch(value);
                              },
                              style: const TextStyle(
                                color: Colors.amber,
                              ),
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Colors.amber,
                                ),
                                labelText: "Search here...",
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
