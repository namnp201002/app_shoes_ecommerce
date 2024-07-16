import 'package:app_shoes_ecommerce/core/error/error_handler.dart';
import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/data/cart/datasources/cart_datasouces.dart';
import 'package:app_shoes_ecommerce/domain/cart/entities/line_item_entity.dart';
import 'package:app_shoes_ecommerce/domain/cart/repository/cart_repository.dart';
import 'package:fpdart/fpdart.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDataSourceImpl cartDataSourceImpl;

  CartRepositoryImpl({required this.cartDataSourceImpl});
  @override
  Future<Either<Failure, List<LineItemEntity>>> getAllItemsInCart(
      CartParams cartParams) async {
    try {
      final data = await cartDataSourceImpl.getAllItemsInCart(cartParams);
      return right(data);
    } catch (err) {
      return left(ErrorHandler.handle(err).failure);
    }
  }
}
