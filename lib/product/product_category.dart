

import 'package:generalshop/exception/exceptions.dart';

class ProductCategory{
int category_id;
String category_name;
String image_direction;
String category_url;

ProductCategory(this.category_id, this.category_name, this.image_direction,
    this.category_url);


ProductCategory.fromJson(Map<String,dynamic>jsonObject){

  assert(jsonObject['category_id'] !=null,'category Id null');
  assert(jsonObject['category_name'] !=null,'category name null');
  assert(jsonObject['image_direction'] !=null,'image direction null');
  assert(jsonObject['category_url'] !=null,'image url null');

  if(jsonObject['category_id']==null){
    throw PropertyIsRequired('category ID');
  }
  if(jsonObject['category_name']==null){
    throw PropertyIsRequired('category Name');
  }
  if(jsonObject['image_direction']==null){
    throw PropertyIsRequired('image direction');
  }
  if(jsonObject['category_url']==null){
    throw PropertyIsRequired('image url');
  }
  this.category_id=jsonObject['category_id'];
  this.category_name=jsonObject['category_name'];
  this.image_direction=jsonObject['image_direction'];
  this.category_url=jsonObject['category_url'];
}
}