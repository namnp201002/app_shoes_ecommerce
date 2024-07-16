part of 'product_detail_bloc.dart';

sealed class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

final class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoadingState extends ProductDetailState {}

class ProductDetailLoadingSuccessState extends ProductDetailState {
  final ProductEntity product;

  const ProductDetailLoadingSuccessState({required this.product});
}

class ProductDetailLoadingErrorState extends ProductDetailState {}
