import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.black26,
      child: ListView.builder(
        itemCount: 10,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final Size size = MediaQuery.of(context).size;
          return SizedBox(
            width: size.width,
            height: size.width / 3,
            child: const Card(
              surfaceTintColor: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
