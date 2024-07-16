import 'dart:async';

import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/usecases/get_product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductUsecase getProductUsecase;
  ProductDetailBloc(this.getProductUsecase) : super(ProductDetailInitial()) {
    on<ProductClickedViewEvent>(_onProductDetail);
  }

  FutureOr<void> _onProductDetail(
      ProductClickedViewEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoadingState());
    final failuerOrSuccess =
        await getProductUsecase.call(ProductUsecaseParams(id: event.id));

    failuerOrSuccess.fold((l) => emit(ProductDetailLoadingErrorState()),
        (r) => emit(ProductDetailLoadingSuccessState(product: r)));
  }
}
