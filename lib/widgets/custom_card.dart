
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_product_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key , required this.products}) : super(key: key);

  ProductModel products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,'UpdateProductPage' , arguments:products );
      },
      child: Stack(
          clipBehavior:Clip.none,
          children:[
            Container(
              // height: 400,

              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 40,
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      offset: Offset(10, 10),
                    )
                  ]
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(products.title.substring(0,11) , style: TextStyle(color: Colors.grey , fontSize: 15),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r'$' '${products.price.toString()}' , style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold),),
                          Icon(Icons.favorite , color: Colors.red,)

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 10,
                bottom: 75,
                child: Image.network(products.image , height: 100, width: 100,))
          ]),
    );
  }
}

