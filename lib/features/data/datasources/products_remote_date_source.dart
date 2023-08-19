import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valu_store_app/core/error/exceptions.dart';
import 'package:valu_store_app/features/data/models/product_model.dart';

abstract class ProductsRemoteDataSource {
  /// Calls the https://fakestoreapi.com/products endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ProductModel>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final http.Client client;

  ProductsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProducts() =>
      _getProductsFromUrl('https://fakestoreapi.com/products');

  Future<List<ProductModel>> _getProductsFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ProductModel.toList(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
