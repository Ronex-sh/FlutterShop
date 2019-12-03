



import 'package:flutter/material.dart';
import 'package:generalshop/screens/home_page.dart';
import 'package:generalshop/screens/onboarding/onboarding_screen.dart';
import 'package:generalshop/screens/utilities/screen_utilities.dart';
import 'package:generalshop/screens/utilities/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_model.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  double screenWidth;
  double screenHeight;
  int currentIndex=0;
  bool lastPage=false;

   PageController _pageController;
  List<OnBoardingModel> screens=[
    OnBoardingModel(image:"assets/images/Untitled-1.jpg" ,title: "Welcome 1",description: "qwertyuo o opok opok opok opok opok opokopok opok opok l"),
    OnBoardingModel(image:"assets/images/Untitled-2.jpg" ,title: "Welcome 2",description: "qwertyuo o opok opok opok opok opok opokopok opok opok 2"),
    OnBoardingModel(image:"assets/images/Untitled-3.jpg" ,title: "Welcome 3",description: "qwertyuo o opok opok opok opok opok opokopok opok opok 3"),
  ];
  ScreenConfig screenConfig;
  WidgetSize widgetSize;

  @override
  void initState() {
    _pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  //  ScreenConfig screenConfig =ScreenConfig(context);
    // print(screenConfig.screenType);
    screenConfig=ScreenConfig(context);
    widgetSize=WidgetSize(screenConfig);

    double _mt =MediaQuery.of(context).size.height *0.2;
    screenHeight=MediaQuery.of(context).size.height;
    screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(

              padding: EdgeInsets.only(top: _mt),
              height: screenHeight,
              width: screenWidth,
             color: Colors.white,

             child: PageView.builder(

               controller:_pageController ,
               itemCount: screens.length,
               itemBuilder:(BuildContext context,int index){
               return SingleOnBoarding(screens[index]);
             } ,
               onPageChanged: (int index){
                 setState(() {
                   currentIndex=index;
                   if(index==(screens.length-1)){
                     lastPage=true;
                   }else{
                     lastPage=false;
                   }
                 });
               },
            ),
            ),
          ),
          Transform.translate(
            offset: Offset(0,-(screenHeight *0.1)),
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                  _drawDots(screens.length)

              ),
            ),
          ),
          (lastPage)?_showButton():Container(),
        ],
      ),
    );
  }
  Widget _showButton(){
    double offset=(screenConfig.screenType==ScreenType.SMALL)?0.04:0.05;
    return Container(

      child: Transform.translate(

      //  offset: Offset(0, -(screenHeight *0.05)), before size screen responsive
        offset: Offset(0, -(screenHeight *offset)),//after size screen responsive
        child: SizedBox(

          width: screenWidth*0.76,
          height: widgetSize.buttonHeight,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),

            color: ScreenUtilities.mainBlue,

            onPressed: ()async{
              var pref=await  SharedPreferences.getInstance();
              pref.setBool('is_seen', true);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  HomePage();
              }));
            },

            child: Text('START',style: TextStyle(color: Colors.white,letterSpacing: 1.3,fontSize: widgetSize.buttonFontSize),),
          ),
        ),
      ),
    );

  }

  List<Widget> _drawDots(int qty){
    List<Widget> widget=[];
    for(int i=0;i<qty;i++){
      widget.add(
        Container(
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: (i==currentIndex)?ScreenUtilities.mainBlue:ScreenUtilities.lightGray
          ),
          width: widgetSize.pagerDotsWidth,
          height: widgetSize.pageDotsHeight,
          margin: (i==qty-1)?EdgeInsets.only(right: 0):EdgeInsets.only(right: 15),
        ),

      );
    }
    return widget;
  }
}
