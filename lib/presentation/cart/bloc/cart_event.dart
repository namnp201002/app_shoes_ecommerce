part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitEvent extends CartEvent {
  final String idCart;

  const CartInitEvent({required this.idCart});
}

class AddToCartEvent extends CartEvent {
  final String idProduct;
  final int quantity;

  const AddToCartEvent({required this.idProduct, required this.quantity});
}

class RemoveFromCartEvent extends CartEvent {
  final String idItem;

  const RemoveFromCartEvent(this.idItem);
}
