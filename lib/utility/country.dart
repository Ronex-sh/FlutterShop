
import 'package:generalshop/exception/exceptions.dart';

class Country{
int country_id;
String country_name;
String capital;
String currency;

Country(this.country_id, this.country_name, this.capital, this.currency);

Country.fromJson(Map<String,dynamic>jsonObject){

  assert(jsonObject['country_id'] !=null,'country id is null');
  assert(jsonObject['country_name'] !=null,'country name is null');
  assert(jsonObject['capital'] !=null,'country capital is null');
  assert(jsonObject['currence'] !=null,'country currence is null');


  if(jsonObject['country_id']==null){
    throw PropertyIsRequired('country id');
  }
  if(jsonObject['country_name']==null){
    throw PropertyIsRequired('country name ');
  }
  if(jsonObject['capital']==null){
    throw PropertyIsRequired('country capital');
  }
  if(jsonObject['currence']==null){
    throw PropertyIsRequired('country currence ');
  }


  this.country_id=jsonObject['country_id'];
  this.country_name=jsonObject['country_name'];
  this.capital=jsonObject['capital'];
  this.currency=jsonObject['currence'];
}


}