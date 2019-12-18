

import 'dart:async';

import 'package:generalshop/api/products_api.dart';
import 'package:generalshop/contracts/contracts.dart';
import 'package:generalshop/product/product.dart';

class HomeProductBloc implements Disposable{

  final StreamController<List<Product>> _ProductsController= StreamController<List<Product>>.broadcast();
  final StreamController<int>_categoryController=StreamController<int>.broadcast();

  Stream<List<Product>>get productStream=>_ProductsController.stream;
  StreamSink<int>get fetchProduct=>_categoryController.sink;
  Stream<int>get category=>_categoryController.stream;

  int categoryID;
  List<Product> products;
  ProductsApi productsApi;


  HomeProductBloc(){
    this.products=[];
     productsApi=ProductsApi();
    _ProductsController.add(this.products);
    _categoryController.add(this.categoryID);
    _categoryController.stream.listen(_fetchCategoryFromApi);
  }
  Future<void> _fetchCategoryFromApi(int category)async{
    this.products=await productsApi.fetchProductsByCategory(category, 1);
    _ProductsController.add(this.products);
 //  print(products[0].product_id);
 // print(category);
  }

  @override
  void dispose() {
    _ProductsController.close();
    _categoryController.close();
  }


}