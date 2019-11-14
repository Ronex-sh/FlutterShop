import 'package:flutter/material.dart';
import 'package:generalshop/screens/home_page.dart';
import 'package:generalshop/screens/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';


//import 'package:generalshop/api/authentication.dart';
//import 'package:generalshop/api/helpers_api.dart';
//import 'package:generalshop/api/products_api.dart';
//import 'package:generalshop/product/product.dart';
//import 'package:generalshop/product/product_category.dart';
//import 'package:generalshop/utility/country.dart';

void main ()async{
  var pref=await  SharedPreferences.getInstance();
  bool isSeen=pref.getBool('is_seen');
  Widget homepage=HomePage();
  if(isSeen==null || !isSeen){
    homepage=OnBoarding();
  }

  runApp(GeneralShop(homepage));
}
class GeneralShop extends StatelessWidget {
  final Widget homepage;

  GeneralShop(this.homepage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'General Shop',
      home: homepage,
      debugShowCheckedModeBanner: false,
    );
  }
}



//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//
//
//  HelpersApi helpersApi=HelpersApi();
//  Authentication authentication=Authentication();
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      appBar: AppBar(title: Text('General Shop'),),
//      body:FutureBuilder(
//            future:helpersApi.fetchCategories(1),
//            builder: (BuildContext context,AsyncSnapshot snapShot){
//              switch(snapShot.connectionState){
//
//                case ConnectionState.none:
//                  return   _error('nothing');
//                  break;
//                case ConnectionState.waiting:
//                  return  _loading();
//                  break;
//                case ConnectionState.active:
//                  return _loading();
//                  break;
//                case ConnectionState.done:
//                  if(snapShot.hasError){
//                    return _error(snapShot.error);
//                  }else{
//                    if(!snapShot.hasData){
//                      return _error('no data');
//                    }else{
//                      return ListView.builder(
//
//                        itemBuilder: (context,int index){
//                          ProductCategory category=snapShot.data[index];
//                          if(category.image_direction=='left') {
//                            return _drawLeftcard(category);
//                          }else{
//                            return _drawRightcard(category);
//                          }
//                        },
//                        itemCount: snapShot.data.length,);
//
//                    }
//                  }
//
//
//                  break;
//              }
//              return Container();
//            },
//          ),
//
//    );
//  }
//
//
//  _drawLeftcard(var item){
//    return Card(
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Row(
//          children: <Widget>[
//            Text(item.category_name),
//            Flexible(child: Image(image: NetworkImage(item.category_url),))
//          ],
//        ),
//      ),
//    );
//  }
//  _drawRightcard(var item){
//    return Card(
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Row(
//          children: <Widget>[
//
//           Flexible(child: Image(image: NetworkImage(item.category_url),)),
//            Text(item.category_name),
//          ],
//        ),
//      ),
//    );
//  }
//
//  _drawProduct(Product product){
//    return Card(
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Column(
//          children: <Widget>[
//            Text(product.product_title),
//            Flexible(
//
//              child: Image(
//                fit: BoxFit.contain,
//                image: NetworkImage(product.images[1]),),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//
//  _error(var error){
//    return Container(
//      child: Center(
//        child: Text(error.toString()),
//      ),
//    );
//  }
//  _loading(){
//    return Container(
//      child: Center(
//        child: CircularProgressIndicator(),
//      ),
//    );
//  }
//}
//
