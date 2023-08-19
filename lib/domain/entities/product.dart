import 'package:valu_store_app/domain/entities/rating.dart';
import 'package:valu_store_app/utils/from_map.dart';

class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final Category? category;
  final String? image;
  final Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    final FromMap converter = FromMap(map: json);
    return Product(
      id: converter.convertToInt(key: "id"),
      title: converter.convertToString(key: "title"),
      price: converter.convertToDouble(key: "price"),
      description: converter.convertToString(key: "description"),
      category: _productCategory(converter.convertToString(key: "category")),
      image: converter.convertToString(key: "image"),
      rating: converter.convertToObjects(jsonData: json["Rating"], modelInstance: Rating()),
    );
  }

  static Category _productCategory(String? category) {
    switch (category) {
      case "men's clothing":
        return Category.mensClothing;
      case "jewelery":
        return Category.jewellery;
      case "electronics":
        return Category.electronics;
      case "women's clothing":
        return Category.womenClothing;
      default:
        return Category.other;
    }
  }
}

enum Category {
  electronics,
  jewellery,
  mensClothing,
  womenClothing,
  other,
}
