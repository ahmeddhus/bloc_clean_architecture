import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valu_store_app/core/routing/route_names.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';
import 'package:valu_store_app/features/presentation/widgets/app_image.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => context.go(
        RouteNames.productDetailsScreen,
        extra: product,
      ),
      child: SizedBox(
        width: size.width,
        height: size.width / 3,
        child: Card(
          surfaceTintColor: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppImage(imageUrl: product.image),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          product.title ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text('${product.price} \$'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
