import 'package:flutter/material.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product? product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Text('${product?.title}');
  }
}
