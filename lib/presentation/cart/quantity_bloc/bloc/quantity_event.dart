part of 'quantity_bloc.dart';

sealed class QuantityEvent extends Equatable {
  const QuantityEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends QuantityEvent {}

class DecrementEvent extends QuantityEvent {}

class QuantityChangedEvent extends QuantityEvent {
  final int quantity;

  const QuantityChangedEvent(this.quantity);

  @override
  List<Object> get props => [quantity];
}
