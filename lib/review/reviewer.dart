
import 'package:generalshop/exception/exceptions.dart';

class Reviewer{
  String first_name,last_name,formatted_name,email;

  Reviewer(this.first_name, this.last_name, this.formatted_name, this.email);

  Reviewer.fromJson(Map<String,dynamic>jsonObject){

    assert(jsonObject['first_name'] !=null,'first name is null');
    assert(jsonObject['last_name'] !=null,'last name is null');
    assert(jsonObject['formatted_name'] !=null,'formatted name is null');
    assert(jsonObject['email'] !=null,'email is null');


    if(jsonObject['first_name']==null){
      throw PropertyIsRequired('first name');
    }
    if(jsonObject['last_name']==null){
      throw PropertyIsRequired('last name');
    }
    if(jsonObject['formatted_name']==null){
      throw PropertyIsRequired('formatted name');
    }
    if(jsonObject['email']==null){
      throw PropertyIsRequired('email');
    }

    this.first_name=jsonObject['first_name'];
    this.last_name=jsonObject['last_name'];
    this.formatted_name=jsonObject['formatted_name'];
    this.email=jsonObject['email'];
  }


}