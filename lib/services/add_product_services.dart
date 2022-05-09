import 'dart:convert';
import 'package:http/http.dart' as http;

class AddProduct {
  Future<dynamic> addProduct(
      {required String title,
      required String price,
      required String descreption,
      required String image,
      required String category}) async {
    http.Response response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      body: {
        'title': title,
        'price': price,
        'description': descreption,
        'image': image,
        'category': category,
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
