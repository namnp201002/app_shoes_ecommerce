import 'package:app_shoes_ecommerce/domain/cart/entities/line_item_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/price_entity.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final int totalItems;
  final int totalUniqueItems;
  final PriceEntity subtotal;
  final List<LineItemEntity> lineItems;

  const CartEntity({
    required this.totalItems,
    required this.totalUniqueItems,
    required this.subtotal,
    required this.lineItems,
  });

  @override
  List<Object?> get props =>
      [totalItems, totalUniqueItems, subtotal, lineItems];
}
