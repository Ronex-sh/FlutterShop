import 'dart:math';

import 'package:flutter/material.dart';
import 'package:generalshop/api/helpers_api.dart';
import 'package:generalshop/product/home_products.dart';
import 'package:generalshop/product/product.dart';
import 'package:generalshop/product/product_category.dart';
import 'package:generalshop/screens/streams/dots_stream.dart';
import 'package:generalshop/screens/utilities/helpers_widgets.dart';
import 'package:generalshop/screens/utilities/screen_utilities.dart';
import 'package:generalshop/screens/utilities/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScreenConfig screenConfig;
  HelpersApi helpersApi = HelpersApi();
  TabController tabController;
  PageController pageController;
  int currentIndex = 0;
  int dotcurrentIndex = 1;
  HomeProductBloc homeProductBloc;
  DotsStream dotsStream = DotsStream();
  List<ProductCategory> productsCategories;

  @override
  void initState() {
    homeProductBloc = HomeProductBloc();
    pageController = PageController(
        initialPage: 1, //لختيار الصفحة التي يبدأ بها التطبيق
        viewportFraction: 0.76 // لتقليل المسافة بين الصفحات

        );

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    homeProductBloc.dispose();
    dotsStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenConfig = ScreenConfig(context);

    return FutureBuilder(
        future: helpersApi.fetchCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductCategory>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return error('no connection made');
              break;
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.done:
            case ConnectionState.active:
              if (snapshot.hasError) {
                return error(snapshot.error.toString());
              } else {
                if (!snapshot.hasData) {
                  return error('no data found');
                } else {
                  this.productsCategories = snapshot.data;
                  homeProductBloc.fetchProduct
                      .add(this.productsCategories[0].category_id);

                  return _screen(snapshot.data, context);
                }
              }
              break;
          }

          return Container();
        });
  }

  Widget _screen(List<ProductCategory> Categories, BuildContext context) {
    tabController = TabController(
        length: Categories.length,
        vsync: this,
        //  initialIndex:currentIndex,//هنا سيتم تحديث الصفحه بأكملها لان العملية سيت ستيت (هنا التاب يبدأ التصفح من صفر ونحنا  جعلناه يتغير وفقا لتغيير السيت ستيت لذلك عند كل تغيير سيبتدأ من الرقم الجديد وتتغير الحاله
        initialIndex: 0);

    return Scaffold(
      //  backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        // elevation: 0,
        title: Text(
          'Home',
          // style: Theme.of(context).textTheme.title
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
          )
        ],
        bottom: TabBar(
          indicatorWeight: 3,
//           labelStyle: TextStyle(fontSize: 20,),
//           labelStyle: TextStyle(fontFamily: "Quicksand",),
          //    unselectedLabelColor:ScreenUtilities.unselected,
//           labelColor:ScreenUtilities.textColor ,
          //  indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: ScreenUtilities.mainBlue,
          controller: tabController,
          isScrollable: true,
          tabs: _table(Categories),
          onTap: (int index) {
            homeProductBloc.fetchProduct.add(this
                .productsCategories[index]
                .category_id); //هنا استخدمنا الستريم بدل السيت ستيت

            //setState(() {// هنا سيتم تحديث الصفحه بأكملها لان العملية سيت ستيت(لذلك سنستعين بالبلوك او ستريم لاننا لانريد تحديث كامل الشاشه جيث يقوم بتحديث نفسه فقط دون التاثير على مكونات او الالمينت الاخرى للشاشه)
            //currentIndex=index;
            // print(currentIndex);
            // });
          },
        ),
      ),

      body: Container(
        child: StreamBuilder(
            stream: homeProductBloc.productStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return error('nothing is working');
                  break;
                case ConnectionState.waiting:
                  return loading();
                  break;
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return error(snapshot.error.toString());
                  } else {
                    if (!snapshot.hasData) {
                      return error("No Data");
                    } else {
                      return _drawProducts(snapshot.data, context);
                    }
                  }
                  break;
              }
              return Container();
            }),
      ),
    );
  }

  List<Product> _randomTopProducts(List<Product> products) {
    List<int> indexes = [];
    Random random = Random();
    int counter = 4;
    List<Product> newProducts = [];
//for(int i=1;i<4;i++){
//  int rnd=random.nextInt(products.length);
//  if(!indexes.contains(rnd)){
//    indexes.add(rnd);
//
//}
    do {
      int rnd = random.nextInt(products.length);
      if (!indexes.contains(rnd)) {
        indexes.add(rnd);
        counter--;
      }
    } while (counter != 0);

    for (int index in indexes) {
      newProducts.add(products[index]);
    }
    return newProducts;
  }

  Widget _drawProducts(List<Product> products, BuildContext context) {
    List<Product> topProducts = _randomTopProducts(products);
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
          child: PageView.builder(
              onPageChanged: (int index) {
                //  dotsStream.dotsSink.add(index);
              },
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: topProducts.length,
              itemBuilder: (context, position) {
                return InkWell(
                  onTap: (){
                    print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    margin: EdgeInsets.only(left: 3, right: 3),
                    clipBehavior: Clip.hardEdge, //لقص حواف الصوره على قالب الاطار

                    child: Container(
                      child: Image(
                        fit: BoxFit
                            .cover, //لجعل الصوره تاخذ كامل الكارد(او الوكنتينر تبعها)
                        image:
                            NetworkImage(topProducts[position].featuredImage()),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 8,right: 8,top: 20),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 9,
                    childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      print(products[index].product_title);
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: 150,
                            child: Image(
                              image:
                                  NetworkImage(products[index].featuredImage()),
                              fit: BoxFit.cover,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(products[index].product_title,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 9),
                          child: Text('\$ ${products[index].product_price.toString()}',
                            style: Theme.of(context).textTheme.subtitle,

                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        )
      ]),
    );
  }

  List<Widget> _drawDots(int qty, index) {
    List<Widget> widget = [];
    for (int i = 0; i < qty; i++) {
      widget.add(
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: (i == index)
                  ? ScreenUtilities.mainBlue
                  : ScreenUtilities.lightGray),
          width: 13,
          height: 13,
          margin: (i == qty - 1)
              ? EdgeInsets.only(right: 0)
              : EdgeInsets.only(right: 10),
        ),
      );
    }
    return widget;
  }

  List<Tab> _table(List<ProductCategory> categories) {
    List<Tab> tabs = [];
    for (ProductCategory category in categories) {
      tabs.add(Tab(
        text: category.category_name,
      ));
    }
    return tabs;
  }
}
