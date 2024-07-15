import 'dart:async';

import 'package:app_shoes_ecommerce/core/usecase/usecase.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/usecases/get_all_product_usecase.dart';
import 'package:app_shoes_ecommerce/domain/product/usecases/get_product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductUseCase getAllProductUseCase;
  final GetProductUsecase getProductUsecase;

  ProductBloc(this.getAllProductUseCase, this.getProductUsecase)
      : super(ProductInitialState()) {
    on<GetAllProductsHomeEvent>(_onGetAllProduct);
  }

  FutureOr<void> _onGetAllProduct(
      GetAllProductsHomeEvent event, Emitter<ProductState> emit) async {
    emit(AllProductsLoadingState());

    final failuerOrSucces = await getAllProductUseCase.call(NoParams());

    failuerOrSucces.fold((l) => emit(AllProductsLoadingErrorState()),
        (r) => emit(AllProductsLoadingSuccessState(data: r)));
  }
}
