
class Reviewer{
  String first_name,last_name,formatted_name,email;

  Reviewer(this.first_name, this.last_name, this.formatted_name, this.email);

  Reviewer.fromJson(Map<String,dynamic>jsonObject){
    this.first_name=jsonObject['first_name'];
    this.last_name=jsonObject['last_name'];
    this.formatted_name=jsonObject['formatted_name'];
    this.email=jsonObject['email'];
  }


}