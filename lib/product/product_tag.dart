

import 'package:generalshop/exception/exceptions.dart';

class ProductTag{
  int tag_id;
  String tag_name;

  ProductTag(this.tag_id, this.tag_name);

  ProductTag.fromJson(Map<String,dynamic>jsonObject){
    if(jsonObject['tag_id']==null){
      throw PropertyIsRequired('tag Id');
    }
    if(jsonObject['tag_name']==null){
      throw PropertyIsRequired('tag Name');
    }
    this.tag_id=jsonObject['tag_id'];
    this.tag_name=jsonObject['tag_name'];
  }

}