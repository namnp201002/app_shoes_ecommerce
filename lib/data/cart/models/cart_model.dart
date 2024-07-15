import 'package:app_shoes_ecommerce/data/cart/models/line_item_model.dart';
import 'package:app_shoes_ecommerce/data/product/models/product_model.dart';
import 'package:app_shoes_ecommerce/domain/cart/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel(
      {required super.totalItems,
      required super.totalUniqueItems,
      required super.subtotal,
      required super.lineItems});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        totalItems: json['total_items'],
        totalUniqueItems: json['total_unique_items'],
        subtotal: PriceModel.fromJson(json['subtotal']),
        lineItems: (json['line_items'] as List)
            .map((e) => LineItemModel.fromJson(e))
            .toList());
  }
}
