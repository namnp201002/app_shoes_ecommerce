part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class ProductClickedViewEvent extends ProductDetailEvent {
  final String id;
  const ProductClickedViewEvent({required this.id});
}
