


import 'package:flutter/material.dart';

enum ScreenType{
SMALL,MEDIUM,LARGE,
}

class ScreenConfig{

  double screenWidth;
  double screenHeight;
  ScreenType screenType;
  ScreenConfig(BuildContext context){
    this.screenWidth=MediaQuery.of(context).size.width;
    this.screenHeight=MediaQuery.of(context).size.height;
     _setScreen();

  }

  void _setScreen(){
    if(this.screenWidth>=320&&this.screenWidth<375){
      this.screenType=ScreenType.SMALL;
    }
    if(this.screenWidth>=375&&this.screenWidth<414){
      this.screenType=ScreenType.MEDIUM;
    }
    if(this.screenWidth>=414){
      this.screenType=ScreenType.LARGE;
    }

  }
}
class WidgetSize{
  double titleFontSize;
  double descriptionFontSize;
  ScreenConfig screenConfig;
  double pagerDotsWidth;
  double pageDotsHeight;
  double buttonHeight;
  double buttonFontSize;

  WidgetSize(ScreenConfig screenConfig ){
    this.screenConfig=screenConfig;
     _init();

  }

  void _init() {
    switch(this.screenConfig.screenType){
      case ScreenType.SMALL:
        this.titleFontSize=16;
        this.descriptionFontSize=13;
        this.pagerDotsWidth=23;
        this.pageDotsHeight=4;
        this.buttonHeight=28;
        this.buttonFontSize=12;
        break;
      case ScreenType.MEDIUM:
        this.titleFontSize=23;
        this.descriptionFontSize=16;
        this.pagerDotsWidth=26;
        this.pageDotsHeight=5;
        this.buttonHeight=33;
        this.buttonFontSize=15;
        break;
      case ScreenType.LARGE:
        this.titleFontSize=27;
        this.descriptionFontSize=19;
        this.pagerDotsWidth=30;
        this.pageDotsHeight=5;
        this.buttonHeight=40;
        this.buttonFontSize=18;
        break;
      default:
        this.titleFontSize=27;
        this.descriptionFontSize=19;
        this.pagerDotsWidth=30;
        this.pageDotsHeight=6;
        this.buttonHeight=40;
        this.buttonFontSize=18;
        break;
    }

  }


}