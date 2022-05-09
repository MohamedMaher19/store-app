class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;

  ProductModel({required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(jsonData){
    return ProductModel(
        image:jsonData['image'] ,
        category:jsonData['category'],
        title:jsonData['title'] ,
        description:jsonData['description'],
        id:jsonData['id'] ,
         price:jsonData['price'],
      rating: RatingModel.formJson(jsonData['rating'])
    );
  }
}

class RatingModel {

  final dynamic rate;
  final int count;

  RatingModel({
    required this.count, required this.rate
  });
  factory RatingModel.formJson(jsonData){
    return RatingModel(
        count: jsonData['count'],
        rate: jsonData['rate']);
  }

}
