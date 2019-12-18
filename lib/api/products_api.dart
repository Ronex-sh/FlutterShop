
import 'dart:convert';

import 'package:generalshop/product/product.dart';
import 'package:http/http.dart'as http;

import 'api_util.dart';

class ProductsApi{


  Map<String,String> Headers={
    'Accept':'application/json',
  };

  Future<List<Product>> fetchProducts(int page)async{

    String url = ApiUtl.PRODUCTS +'?page='+ page.toString();

    http.Response response= await http.get(url,headers: Headers);

    List<Product> products=[];

    if(response.statusCode==200){

      var body=jsonDecode(response.body);

      for(var item in  body['data']){

        products.add(Product.fromJson(item));

        
      }
      return products;

    }

    return null;
  }

  Future<List<Product>> fetchProductsByCategory(int category,int page)async{

    String url = ApiUtl.CATEGORY_PRODUCTS(category, page);

    http.Response response= await http.get(url,headers: Headers);

    List<Product> products=[];

    if(response.statusCode==200){

      var body=jsonDecode(response.body);

      for(var item in  body['data']){

        products.add(Product.fromJson(item));


      }
      return products;

    }

    return null;
  }

  Future<Product> fetchProduct(int product_id)async{
    String url = ApiUtl.PRODUCT + product_id.toString();
    http.Response response=await http.get(url,headers: Headers);
    if(response.statusCode==200){
      var body=jsonDecode(response.body);
      return Product.fromJson(body['data']);
    }
    return null;
  }
}