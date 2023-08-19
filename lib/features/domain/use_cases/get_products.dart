import 'package:dartz/dartz.dart';
import 'package:valu_store_app/core/error/failures.dart';
import 'package:valu_store_app/core/usecases/usecase.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';
import 'package:valu_store_app/features/domain/repositories/products_repository.dart';

class GetProducts implements UseCase<List<Product>, NoParams> {
  final ProductsRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getProducts();
  }
}
