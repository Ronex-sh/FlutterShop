
import 'dart:async';

import 'package:generalshop/contracts/contracts.dart';
import 'package:generalshop/product/product_category.dart';

class CategoriesStream implements Disposable{
  List<ProductCategory> categories;
  StreamController<List<ProductCategory>> _categoriesStream=StreamController<List<ProductCategory>>.broadcast();

 Stream<List<ProductCategory>> get categoriesStream => _categoriesStream.stream;
 StreamSink<List<ProductCategory>> get categoriesSink=>_categoriesStream.sink;

  CategoriesStream(){
    categories=[];
    _categoriesStream.add(categories);
    _categoriesStream.stream.listen(_fetchCategories);

  }

  Future<void> _fetchCategories (List<ProductCategory> c)async{

  }

  @override
  void dispose() {
   _categoriesStream.close();
  }
}