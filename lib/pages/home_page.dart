import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_services.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor:Colors.white,
        actions: [
          IconButton(
           icon:Icon(FontAwesomeIcons.cartPlus ,color: Colors.black),
          onPressed: (){},
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text('Fashion Store' ,
        style: TextStyle(
          fontFamily: 'Pacifico',
          color: Colors.teal,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16 , right: 16 , top: 70),
        child:FutureBuilder<List<ProductModel>>(
          future:AllProductsServices().getAllProducts() ,
          builder:(context , snapshot){

             print(snapshot.data);

            if(snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,


                  ), itemBuilder: (context, index) {
                return CustomCard(products: products[index],);
              });
            }else{
              return Center(child: CircularProgressIndicator());
            }
          } ,
        )
      ));

  }
}
