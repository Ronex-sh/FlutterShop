
import 'package:generalshop/api/api_util.dart';
import 'package:generalshop/customer/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Authentication{

  Future<User>register(String first_name,String last_name,String email,String password)async{
    Map<String,String> Headers={
      'Accept':'application/json',
    };

    Map<String,String>Body={
      'first_name':first_name,
      'last_name':last_name,
      'email':email,
      'password':password,
    };

  http.Response response=await http.post(ApiUtl.AUTH_REGISTER,headers:Headers,body: Body);


  if(response.statusCode==201){
    //Success user Register
    var body=jsonDecode(response.body);
    var data= body["data"];
    return User.froJson(data);
  }
    return null;

  }

 Future<User> login(String email,String password)async{

    Map<String,String> Headers={
      'Accept':'application/json',
    };
    Map<String,String> Body={
      'email': email,
      'password':password,
    };

    http.Response response= await http.post(ApiUtl.AUTH_LOGIN,headers:Headers,body: Body);

    print('after');

    if(response.statusCode==200){
      var body=jsonDecode(response.body);
      var data=body["data"];
      print(data);
      return User.froJson(data);
    }
    print(response.statusCode);

    print(response.body);

      return null;

  }
}