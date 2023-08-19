import 'package:equatable/equatable.dart';
import 'package:valu_store_app/features/domain/entities/rating.dart';

class Product extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final Category? category;
  final String? image;
  final Rating? rating;

  const Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  List<Object?> get props => [id];
}

enum Category {
  electronics,
  jewellery,
  mensClothing,
  womenClothing,
  other,
}
