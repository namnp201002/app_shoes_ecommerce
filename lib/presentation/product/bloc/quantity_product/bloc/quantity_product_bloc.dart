import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quantity_product_event.dart';

class QuantityProductBloc extends Bloc<QuantityProductEvent, int> {
  Timer? _debounce;

  QuantityProductBloc(super.initialQuantity) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
    on<QuantityChangedEvent>(_onQuantityChanged);
  }

  void _onIncrement(IncrementEvent event, Emitter<int> emit) {
    emit(state + 1);
    _startDebounce();
  }

  void _onDecrement(DecrementEvent event, Emitter<int> emit) {
    if (state > 1) {
      emit(state - 1);
      _startDebounce();
    }
  }

  void _onQuantityChanged(QuantityChangedEvent event, Emitter<int> emit) {
    print('Request API Quantity Product: ${event.quantity}');
  }

  void _startDebounce() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      add(QuantityChangedEvent(state));
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
