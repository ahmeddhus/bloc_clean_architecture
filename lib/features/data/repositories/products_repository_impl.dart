import 'package:dartz/dartz.dart';
import 'package:valu_store_app/core/error/exceptions.dart';
import 'package:valu_store_app/core/error/failures.dart';
import 'package:valu_store_app/core/network/network_info.dart';
import 'package:valu_store_app/features/data/datasources/products_local_date_source.dart';
import 'package:valu_store_app/features/data/datasources/products_remote_date_source.dart';
import 'package:valu_store_app/features/data/models/product_model.dart';
import 'package:valu_store_app/features/domain/repositories/products_repository.dart';

typedef _ConcreteOrRandomChooser = Future<List<ProductModel>> Function();

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final ProductsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    return await _getTrivia(() {
      return remoteDataSource.getProducts();
    });
  }

  Future<Either<Failure, List<ProductModel>>> _getTrivia(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await getConcreteOrRandom();
        localDataSource.cacheProductsList(remoteProducts);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getLastProducts();
        return Right(localProducts);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
