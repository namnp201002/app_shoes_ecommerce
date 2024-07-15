import 'package:app_shoes_ecommerce/data/cart/models/selected_option_model.dart';
import 'package:app_shoes_ecommerce/data/product/models/product_model.dart';
import 'package:app_shoes_ecommerce/domain/cart/entities/line_item_entity.dart';

class LineItemModel extends LineItemEntity {
  const LineItemModel(
      {required super.id,
      required super.productId,
      required super.name,
      required super.productName,
      required super.sku,
      required super.permalink,
      required super.quantity,
      required super.price,
      required super.lineTotal,
      required super.isValid,
      required super.productMeta,
      required super.selectedOptions,
      required super.variant,
      required super.image,
      required super.tax});

  factory LineItemModel.fromJson(Map<String, dynamic> json) {
    return LineItemModel(
        id: json['id'],
        productId: json['product_id'],
        name: json['name'],
        productName: json['product_name'],
        sku: json['sku'],
        permalink: json['permalink'],
        quantity: json['quantity'],
        price: PriceModel.fromJson(json['price']),
        lineTotal: PriceModel.fromJson(json['line_total']),
        isValid: json['is_valid'],
        productMeta: json['product_meta'],
        selectedOptions: ((json['selected_options'] ?? []) as List)
            .map((e) => SelectedOptionModel.fromJson(e))
            .toList(),
        variant: json['variant'],
        image: ImageModel.fromJson(json['image']),
        tax: json['tax']);
  }
}
