import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/services/get_all_products_services.dart';

class UpdateProductServices {
  Future<dynamic> updateProduct(
      {required String title,
        required int id ,
        required String price,
        required String descreption,
        required String image,
        required String category}) async {
    print('product id = $id');
    http.Response response = await http.put(
      Uri.parse('https://fakestoreapi.com/products/$id'),
      body: {
        'title': title,
        'price': price,
        'description': descreption,
        'image': image,
        'category': category,
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);

    return data;
  }
}
