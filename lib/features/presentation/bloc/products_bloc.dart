import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valu_store_app/core/error/failures.dart';
import 'package:valu_store_app/core/usecases/usecase.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';
import 'package:valu_store_app/features/domain/use_cases/get_products.dart';
import 'package:valu_store_app/features/presentation/bloc/bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;

  ProductsBloc({
    required GetProducts products,
  })  : getProducts = products,
        super(Empty()) {
    on<ProductsEvent>(_mapGetProductsEventToState);
    add(GetProductsEvent());
  }

  Future<void> _mapGetProductsEventToState(event, emit) async {
    if (event is GetProductsEvent) {
      emit(Loading());
      final failureOrProducts = await getProducts(NoParams());
      emit(_eitherLoadedOrErrorState(failureOrProducts));
    }
  }

  ProductsState _eitherLoadedOrErrorState(
    Either<Failure, List<Product>> failureOrProducts,
  ) =>
      failureOrProducts.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (product) => Loaded(products: product),
      );

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
