


import 'package:generalshop/exception/exceptions.dart';
import 'package:generalshop/product/product_category.dart';
import 'package:generalshop/product/product_tag.dart';
import 'package:generalshop/product/product_unit.dart';
import 'package:generalshop/review/product_review.dart';
import 'package:generalshop/review/reviewer.dart';

class Product{
  int product_id;
  String product_title;
  String product_description;
  ProductUnit productUnit;
  double product_price,product_total,product_discount;
  ProductCategory productCategory;
  List<ProductTag> tags;
  List<String>images;
  List<ProductReview> reviews;


  Product(this.product_id, this.product_title, this.product_description,
      this.productUnit, this.product_price, this.product_total,
      this.product_discount, this.productCategory, this.tags, this.images,
      this.reviews);

  Product.fromJson(Map<String,dynamic>jsonObject){
// assert(jsonObject['product_id'] !=null,'product Id null); this just to dev in >>final app its removes
    assert(jsonObject['product_id'] !=null,'product Id null');
    assert(jsonObject['product_title'] !=null,'product title null');
    assert(jsonObject['product_description'] !=null,'product description null');
    assert(jsonObject['product_price'] !=null,'product price null');

  //or used
    if(jsonObject['product_id']==null){
      throw PropertyIsRequired('product Id');
    }
    if(jsonObject['product_title']==null){
      throw PropertyIsRequired('product Title');
    }
    if(jsonObject['product_description']==null){
      throw PropertyIsRequired('product Description');
    }
    if(jsonObject['product_price']==null){
      throw PropertyIsRequired('product Price');
    }

    this.product_id=jsonObject['product_id'];
    this.product_title=jsonObject['product_title'];
    this.product_description=jsonObject['product_description'];
    this.product_price=double.parse(jsonObject['product_price']);
    this.product_total=double.parse(jsonObject['product_total']);
    this.product_discount=double.parse(jsonObject['product_discount']);
    this.productCategory=ProductCategory.fromJson(jsonObject['product_category']);

    this.tags=[];
    if(jsonObject['product_tags']!=null){
      _setTags(jsonObject['product_tags']);
    }
    _setImages(jsonObject['product_images']);
    _setReviews(jsonObject['product_reviews']);
  }

  void _setReviews(List<dynamic>reviewsJson){
    this.reviews=[];
    if(reviewsJson.length>0){
      for(var item in reviewsJson){
        if(item !=null){
          this.reviews.add(ProductReview.fromJson(item));
        }
      }
    }

  }

  void _setTags(List<dynamic>tagsJson){

    if(tagsJson.length>0){
      for(var item in tagsJson){
        if(item !=null){
          this.tags.add(ProductTag.fromJson(item));
        }

      }
    }

  }

  void _setImages(List<dynamic>jsonImages){
    this.images=[];
    if(jsonImages.length>0){
      for(var image in jsonImages){
        if(image !=null){
          this.images.add(image['image_url']);
        }

      }
    }

  }

}