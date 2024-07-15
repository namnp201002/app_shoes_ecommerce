import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/core/usecase/usecase.dart';
import 'package:app_shoes_ecommerce/domain/cart/entities/line_item_entity.dart';
import 'package:app_shoes_ecommerce/domain/cart/repository/cart_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllItemsInCartUsecase
    extends BaseUsecase<List<LineItemEntity>, CartParams> {
  final CartRepository cartRepository;

  GetAllItemsInCartUsecase({required this.cartRepository});

  @override
  Future<Either<Failure, List<LineItemEntity>>> call(CartParams params) {
    cartRepository.getAllItemsInCart(params);
    throw UnimplementedError();
  }
}
