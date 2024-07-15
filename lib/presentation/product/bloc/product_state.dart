part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {}

class AllProductsLoadingState extends ProductState {}

class AllProductsLoadingSuccessState extends ProductState {
  final List<ProductEntity> data;

  const AllProductsLoadingSuccessState({required this.data});
}

class AllProductsLoadingErrorState extends ProductState {}
