import 'package:valu_store_app/core/util/from_map.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';
import 'package:valu_store_app/features/domain/entities/rating.dart';

class ProductModel extends Product {
  const ProductModel({
    int? id,
    String? title,
    double? price,
    String? description,
    Category? category,
    String? image,
    Rating? rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
          rating: rating,
        );

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    final FromMap converter = FromMap(map: json);
    return ProductModel(
      id: converter.convertToInt(key: "id"),
      title: converter.convertToString(key: "title"),
      price: converter.convertToDouble(key: "price"),
      description: converter.convertToString(key: "description"),
      category: _productCategory(converter.convertToString(key: "category")),
      image: converter.convertToString(key: "image"),
      rating: converter.convertToObjects(jsonData: json["Rating"], modelInstance: Rating()),
    );
  }

  static List<ProductModel> toList(dynamic jsonData) {
    return jsonData is List<dynamic>
        ? List<ProductModel>.from(jsonData.map((dynamic x) {
            return ProductModel.fromMap(x as Map<String, dynamic>);
          }))
        : <ProductModel>[];
  }

  static List<ProductModel> listToJson(dynamic jsonData) {
    return jsonData is List<dynamic>
        ? List<ProductModel>.from(jsonData.map((dynamic x) {
            return ProductModel.fromMap(x as Map<String, dynamic>);
          }))
        : <ProductModel>[];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category.toString(),
        'image': image,
        'rating': rating?.toJson(),
      };

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
