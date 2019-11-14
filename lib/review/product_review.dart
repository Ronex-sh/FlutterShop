

import 'package:generalshop/exception/exceptions.dart';
import 'package:generalshop/review/reviewer.dart';

class ProductReview{
  int review_id,stars;
  String review;
  Reviewer reviewer;

  ProductReview(this.review_id, this.stars, this.review, this.reviewer);

  ProductReview.fromJson(Map<String,dynamic>jsonObject){

    assert(jsonObject['review_id'] !=null,'review Id null');
    assert(jsonObject['stars'] !=null,'stars null');
    assert(jsonObject['review'] !=null,'review null');
    assert(jsonObject['reviewer'] !=null,'reviewer null');


    if(jsonObject['review_id']==null){
      throw PropertyIsRequired('review id');
    }
    if(jsonObject['stars']==null){
      throw PropertyIsRequired('stars');
    }
    if(jsonObject['review']==null){
      throw PropertyIsRequired('review');
    }
    if(jsonObject['reviewer']==null){
      throw PropertyIsRequired('reviewer');
    }

    this.review_id=jsonObject['review_id'];
    this.stars=jsonObject['stars'];
    this.review=jsonObject['review'];
    this.reviewer=Reviewer.fromJson(jsonObject['reviewer']);
  }

}