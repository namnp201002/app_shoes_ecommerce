part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class AddToCartState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<LineItemEntity> listItems;

  const CartLoadedState({required this.listItems});
}

class CartLoadedFailState extends CartState {}
