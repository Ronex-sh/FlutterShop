

import 'dart:convert';

import 'package:generalshop/api/api_util.dart';
import 'package:generalshop/product/product_category.dart';
import 'package:generalshop/product/product_tag.dart';
import 'package:generalshop/utility/country.dart';
import 'package:generalshop/utility/country_city.dart';
import 'package:generalshop/utility/country_state.dart';
import 'package:http/http.dart' as http;

class HelpersApi {

  Map<String,String> Headers={
    'Accept':'application/json',
  };

  Future<List<ProductCategory>>fetchCategories(int page)async {


     String url=ApiUtl.CATEGORIES+'?page='+page.toString();
     http.Response response =await http.get(url,headers: Headers);
     List<ProductCategory>categories=[];
     if(response.statusCode==200){
       var body=jsonDecode(response.body);
       for(var item in body['data']){
         categories.add(ProductCategory.fromJson(item));

       }
       return categories;
     }
     return null;
     
     }


  Future<List<ProductTag>>fetchTags(int page)async{
    String url =ApiUtl.TAGS+'?page='+page.toString();
    http.Response response= await http.get(url,headers: Headers);
    List<ProductTag> tags=[];
    if(response.statusCode==200){
      var body= jsonDecode(response.body);
      for(var item in body['data']){
        tags.add(ProductTag.fromJson(item));
      }
      return tags;
    }
      return null;



  }

  Future<List<Country>>fetchCountries(int page)async{
    String url =ApiUtl.COUNTRIES+'?page='+page.toString();

    http.Response response =await http.get(url,headers: Headers);
    List<Country>countries=[];
    if(response.statusCode==200){
      var body=jsonDecode(response.body);
      for(var item in body['data']){
        countries.add(Country.fromJson(item));

      }
      return countries;
    }
    return null;

  }

  Future<List<CountryState>>fetchStates(int country,int page)async{
  String url =ApiUtl.STATES(country)+'?page='+page.toString();
  http.Response response=await http.get(url,headers: Headers);
  List<CountryState>states=[];
  if(response.statusCode==200){
    var body=jsonDecode(response.body);
    for(var item in body['data']){
      states.add(CountryState.fromJson(item));

    }
    return states;
  }
  return null;

  }

 Future<List<CountryCity>> fetchCities(int country,int page)async{
   String url = ApiUtl.CITIES(country)+'?page='+page.toString();
//   print(url);
   http.Response response=await http.get(url,headers: Headers);
   List<CountryCity>ciries=[];
   if(response.statusCode==200){
     var body=jsonDecode(response.body);
     for(var item in body['data']){
       ciries.add(CountryCity.fromJson(item));

     }
     return ciries;
   }
   return null;

  }
}