import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:valu_store_app/core/error/exceptions.dart';
import 'package:valu_store_app/features/data/models/product_model.dart';

abstract class ProductsLocalDataSource {
  /// Gets the cached [ProductModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<ProductModel>> getLastProducts();

  Future<void> cacheProductsList(List<ProductModel> productsList);
}

const CACHED_PRODUCTS = 'CACHED_PRODUCTS';

class NumberTriviaLocalDataSourceImpl implements ProductsLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ProductModel>> getLastProducts() {
    final jsonString = sharedPreferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      return Future.value(ProductModel.toList(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheProductsList(List<ProductModel> productsList) {
    return sharedPreferences.setString(
      CACHED_PRODUCTS,
      json.encode(productsList.map((product) => product.toJson()).toList()),
    );
  }
}
