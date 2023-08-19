import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valu_store_app/features/presentation/bloc/bloc.dart';
import 'package:valu_store_app/features/presentation/screens/home/widgets/product_item.dart';
import 'package:valu_store_app/features/presentation/screens/home/widgets/product_shimmer.dart';
import 'package:valu_store_app/features/presentation/widgets/message_display.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is Empty) {
                return const MessageDisplay(
                  message: 'Empty!',
                );
              } else if (state is Loading) {
                return const ProductShimmer();
              } else if (state is Loaded) {
                return SafeArea(
                  child: ListView.separated(
                    itemCount: state.products.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ProductItem(product: state.products[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8);
                    },
                  ),
                );
              } else if (state is Error) {
                return MessageDisplay(message: state.message);
              } else {
                return const Center(child: Text('unexpected error has occurred!'));
              }
            },
          ),
        ),
      ),
    );
  }
}
