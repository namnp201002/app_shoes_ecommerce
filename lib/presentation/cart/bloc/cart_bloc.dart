import 'dart:async';

import 'package:app_shoes_ecommerce/domain/cart/entities/line_item_entity.dart';
import 'package:app_shoes_ecommerce/domain/cart/repository/cart_repository.dart';
import 'package:app_shoes_ecommerce/domain/cart/usecases/get_all_items_in_cart_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllItemsInCartUsecase getAllItemsInCartUsecase;

  CartBloc(this.getAllItemsInCartUsecase) : super(CartInitial()) {
    on<CartInitEvent>(_onInitCart);

    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
  }

  FutureOr<void> _onInitCart(
      CartInitEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());

    final failuerOrSuccess =
        await getAllItemsInCartUsecase.call(CartParams(id: event.idCart));

    failuerOrSuccess.fold((l) => emit(CartLoadedFailState()),
        (r) => emit(CartLoadedState(listItems: r)));
  }

  FutureOr<void> _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {}

  FutureOr<void> _onRemoveFromCart(
      RemoveFromCartEvent event, Emitter<CartState> emit) {}
}
