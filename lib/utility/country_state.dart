
import 'package:generalshop/exception/exceptions.dart';

class CountryState{
  int state_id;
  String state_name;


  CountryState(this.state_id, this.state_name);

  CountryState.fromJson(Map<String,dynamic>jsonObject){

    assert(jsonObject['state_id'] !=null,'state id is null');
    assert(jsonObject['state_name'] !=null,'state name is null');

    if(jsonObject['state_id']==null){
      throw PropertyIsRequired('state id');
    }
    if(jsonObject['state_name']==null){
      throw PropertyIsRequired('state name ');
    }
    this.state_id=jsonObject['state_id'];
    this.state_name=jsonObject['state_name'];

  }

}