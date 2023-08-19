import 'package:dartz/dartz.dart';
import 'package:valu_store_app/core/error/failures.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
