
import 'package:flutter/material.dart';
import 'package:generalshop/product/product.dart';

class SingleProduct extends StatefulWidget {
  final Product product;

  SingleProduct(this.product);

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.product_title),),
      body: _drawScreen(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: (){
          //todo.....
        },
      ),
    );
  }

  Widget _drawScreen(BuildContext context) {
    return SingleChildScrollView(
       child: Column(
         children: <Widget>[
           SizedBox(
               height: MediaQuery.of(context).size.height*0.33,

               child: _drawImageGallery(context)),
           _drawTitle(context),
           _drawDetails(context),
         ],
       ),
    );
  }

 Widget _drawImageGallery(BuildContext context) {
  return PageView.builder(
    itemCount: widget.product.images.length,
    itemBuilder: (context,int position){
      return Container(
        child: Image(fit: BoxFit.cover,image: NetworkImage(widget.product.images[position])),
      );
    },

  );
  }
  Widget _drawTitle(BuildContext context){
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(widget.product.product_title,style: Theme.of(context).textTheme.subtitle,),
                SizedBox(height: 16,),
                Text(widget.product.productCategory.category_name,style: Theme.of(context).appBarTheme.textTheme.display1,),

              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('\$${widget.product.product_price.toString()}'),
                SizedBox(height: 16,),
                (widget.product.product_discount>0)?Text(_calculateDiscount()):Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

 Widget _drawDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
  child: Text(widget.product.product_description,style: Theme.of(context).textTheme.display2,),
    );
  }

  String _calculateDiscount() {
    double discount=widget.product.product_discount;
    double price=widget.product.product_price;
    return (discount*price).toString();
  }

}
