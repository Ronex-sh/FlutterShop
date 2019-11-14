
import 'package:generalshop/exception/exceptions.dart';

class CountryCity{
int city_id;
String city_name;

CountryCity(this.city_id, this.city_name);

CountryCity.fromJson(Map<String,dynamic>jsonObject){

  assert(jsonObject['city_id'] !=null,'city id is null');
  assert(jsonObject['city_name'] !=null,'city name is null');

  if(jsonObject['city_id']==null){
    throw PropertyIsRequired('city id');
  }
  if(jsonObject['city_name']==null){
    throw PropertyIsRequired('city name ');
  }


  this.city_id=jsonObject['city_id'];
  this.city_name=jsonObject['city_name'];

}



}