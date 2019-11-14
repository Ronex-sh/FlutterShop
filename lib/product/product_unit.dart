

import 'package:generalshop/exception/exceptions.dart';

class ProductUnit{
  int unit_id;
  String unit_name,unit_code;

  ProductUnit(this.unit_id, this.unit_name, this.unit_code);
  ProductUnit.fromJson(Map<String,dynamic>jsonObject){

    assert(jsonObject['unit_id'] !=null,'unit Id null');
    assert(jsonObject['unit_name'] !=null,'unit name null');
    assert(jsonObject['unit_code'] !=null,'unit code null');


    if(jsonObject['unit_id']==null){
      throw PropertyIsRequired('unit Id');
    }
    if(jsonObject['unit_name']==null){
      throw PropertyIsRequired('unit Name');
    }
    if(jsonObject['unit_code']==null){
      throw PropertyIsRequired('unit Code');
    }
    this.unit_id=jsonObject['unit_id'];
    this.unit_name=jsonObject['unit_name'];
    this.unit_code=jsonObject['unit_code'];
  }

}