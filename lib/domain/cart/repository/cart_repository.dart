// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/domain/cart/entities/line_item_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<LineItemEntity>>> getAllItemsInCart(
      CartParams cartParams);
}

class CartParams {
  String id;
  CartParams({
    required this.id,
  });
}
