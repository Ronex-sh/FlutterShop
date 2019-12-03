import 'package:flutter/material.dart';
import 'package:generalshop/screens/utilities/screen_utilities.dart';

Widget loading(){
  return Container(
    color: Colors.white,
    child: Center(
      child: CircularProgressIndicator(backgroundColor: ScreenUtilities.textColor,),
    ),
  );
}

Widget error(String error){
  return Container(

    child: Center(
      child: Text(error,style: TextStyle(color: Colors.red),),
    ),
  );
}