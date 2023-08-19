import 'package:flutter/material.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';
import 'package:valu_store_app/features/presentation/screens/details/widgets/product_details_header.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product? product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ProductDetailsHeader(product: product),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  product?.title ?? '',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SafeArea(
                  child: Text(
                product?.description ?? '',
                style: theme.textTheme.bodyMedium,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
