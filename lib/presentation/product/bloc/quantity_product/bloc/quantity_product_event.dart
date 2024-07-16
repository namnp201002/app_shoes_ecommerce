part of 'quantity_product_bloc.dart';

sealed class QuantityProductEvent extends Equatable {
  const QuantityProductEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends QuantityProductEvent {}

class DecrementEvent extends QuantityProductEvent {}

class QuantityChangedEvent extends QuantityProductEvent {
  final int quantity;

  const QuantityChangedEvent(this.quantity);

  @override
  List<Object> get props => [quantity];
}
