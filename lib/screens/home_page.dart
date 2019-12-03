
import 'package:flutter/material.dart';
import 'package:generalshop/api/helpers_api.dart';
import 'package:generalshop/product/product_category.dart';
import 'package:generalshop/screens/utilities/helpers_widgets.dart';
import 'package:generalshop/screens/utilities/screen_utilities.dart';
import 'package:generalshop/screens/utilities/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  ScreenConfig screenConfig;
  HelpersApi helpersApi = HelpersApi();
  TabController tabController;


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    screenConfig =ScreenConfig(context);
    
    return FutureBuilder(
        future: helpersApi.fetchCategories(),
        builder:(BuildContext context,AsyncSnapshot<List<ProductCategory>>snapshot){

          switch(snapshot.connectionState){

            case ConnectionState.none:
               return error('no connection made');
              break;
            case ConnectionState.waiting:
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.done:
              if(snapshot.hasError){
                return error(snapshot.error.toString());
              }else{
                if(!snapshot.hasData){
                  return error('no data found');
                }else{

                 return _Screen(snapshot.data);
                }
              }
              break;
          }

          return Container();
        });


  }
  Widget _Screen(List<ProductCategory> Categories){

    tabController=TabController(
        length: Categories.length,
        vsync: this,
        initialIndex: 0);

    return Scaffold(
      //  backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        // elevation: 0,
        title:  Text('Home',
          // style: Theme.of(context).textTheme.title
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(icon: Icon(Icons.search), onPressed: (){}),
          )
        ],
         bottom:TabBar(

//           labelStyle: TextStyle(fontSize: 20,),
//           labelStyle: TextStyle(fontFamily: "Quicksand",),
           unselectedLabelColor:ScreenUtilities.unselected,
//           labelColor:ScreenUtilities.textColor ,
           indicatorSize: TabBarIndicatorSize.label,
           indicatorColor: ScreenUtilities.mainBlue,
           controller: tabController,
             isScrollable: true,
             tabs:_table(Categories),

         ) ,
      ),

      body: Container(

      ),
    );
  }
  List<Tab> _table(List<ProductCategory> categories){
     List<Tab> tabs=[];
     for(ProductCategory category in categories){
      tabs.add(Tab(
        text: category.category_name,
      ));
     }
     return tabs;
  }
}

