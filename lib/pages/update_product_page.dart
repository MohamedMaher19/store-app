import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helpers/show_snack_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
   UpdateProductPage({Key? key}) : super(key: key);

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String ? productName;
  String ? description;
  String ? image;
  String ? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    // نستقبل البرودكت ال بعتناه اثناء الضغط علي الكارد
// لان عند تعديل اي منتج الطبيعي ان بياناته تكون مكتوبه وانت تعدل فيها
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall:isLoading ,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Update Products' , style: TextStyle(
            fontFamily: 'Pacifico' , color: Colors.teal,
            fontSize: 28,
          ),),
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15,),

                  CustomTextField(
                    onChange: (data){
                      productName = data;
                    },
                    hintText: 'Product Name',
                  ),
                  SizedBox(height: 15,),
                  CustomTextField(
                    onChange: (data){
                      description = data;
                    },
                    hintText: 'description',
                  ),
                  SizedBox(height: 15,),

                  CustomTextField(
                    onChange: (data){
                      price = data;
                    },
                    inputType:TextInputType.number ,
                    hintText: 'price',
                  ),
                  SizedBox(height: 15,),

                  CustomTextField(
                    onChange: (data){
                      image = data;
                    },
                    hintText: 'image',
                  ),
                  SizedBox(height: 30,),
                  CustomButton(
                    text: 'Update',
                    onTap: () async{
                      isLoading = true;
                       setState(() {

                       });
                       try{

                      await UpdateProductServices().updateProduct(
                          title: productName == null ? product.title : productName!,
                          id: product.id,
                          price: price == null ? product.price.toString() : price!,
                          descreption: description == null ? product.description : description!,
                          image: image == null ? product.image : image!,
                          category: product.category // لان ف الاغلب الكاتجوري مش بيتغير في التعديل بتع المنتج ف بعمله اكسس من الموديل نفسه
                      );
                      showSnackBar(context, 'Success');
                       }

                       catch(e){
                         print(e.toString());
                         showSnackBar(context, 'there is an error');


                       };
                      isLoading = false;
                      setState(() {});

                    }

                  ),


                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
