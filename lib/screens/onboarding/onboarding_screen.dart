
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboarding_model.dart';

class SingleOnBoarding extends StatelessWidget {

 final OnBoardingModel onBoardingModel;

  SingleOnBoarding(this.onBoardingModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          width: MediaQuery.of(context).size.width*0.74,
          child: Image(
           fit: BoxFit.cover,
          image: ExactAssetImage(onBoardingModel.image)),
        ),
        SizedBox(height: 20,),
        Text(onBoardingModel.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        SizedBox(height: 11,),
        Padding(
          padding: const EdgeInsets.only(left: 22,right: 22),
          child: Text(onBoardingModel.description,style: TextStyle(height: 1.3,fontSize: 19,color: Colors.blueGrey),textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}
