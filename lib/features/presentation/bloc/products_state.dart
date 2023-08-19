import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:valu_store_app/features/domain/entities/product.dart';

@immutable
abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProductsState {}

class Loading extends ProductsState {}

class Loaded extends ProductsState {
  final List<Product> products;

  Loaded({required this.products});

  @override
  List<Object> get props => [products];
}

class Error extends ProductsState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
