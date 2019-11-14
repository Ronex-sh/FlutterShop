
import 'package:generalshop/exception/exceptions.dart';

class User{

  String first_name;
  String last_name;
  String email;
  String api_token;
  int    user_id;

  User(this.first_name, this.last_name, this.email, [this.api_token,this.user_id]  );

  User.froJson(Map<String,dynamic> jsonObject){

    assert(jsonObject['user_id'] !=null,'user Id null');
    assert(jsonObject['first_name'] !=null,'first name null');
    assert(jsonObject['last_name'] !=null,'last name null');
    assert(jsonObject['email'] !=null,'email null');
    assert(jsonObject['api_token'] !=null,'api token null');


    if(jsonObject['user_id']==null){
      throw PropertyIsRequired('user Id');
    }

    if(jsonObject['first_name']==null){
      throw PropertyIsRequired('first name ');
    }
    if(jsonObject['last_name']==null){
      throw PropertyIsRequired('last name');
    }
    if(jsonObject['email']==null){
      throw PropertyIsRequired('email');
    }
    if(jsonObject['api_token']==null){
      throw PropertyIsRequired('api token');
    }


    this.user_id=jsonObject['user_id'];
    this.first_name=jsonObject['first_name'];
    this.last_name=jsonObject['last_name'];
    this.email=jsonObject['email'];
    this.api_token=jsonObject['api_token'];
  }

}