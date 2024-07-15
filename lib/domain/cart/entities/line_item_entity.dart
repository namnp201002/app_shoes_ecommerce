import 'package:app_shoes_ecommerce/domain/cart/entities/selected_option_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/image_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/price_entity.dart';
import 'package:equatable/equatable.dart';

class LineItemEntity extends Equatable {
  final String id;
  final String productId;
  final String name;
  final String productName;
  final String sku;
  final String permalink;
  final int quantity;
  final PriceEntity price;
  final PriceEntity lineTotal;
  final bool isValid;
  final List<dynamic> productMeta;
  final List<SelectedOptionEntity> selectedOptions;
  final dynamic variant;
  final ImageEntity image;
  final dynamic tax;

  const LineItemEntity(
      {required this.id,
      required this.productId,
      required this.name,
      required this.productName,
      required this.sku,
      required this.permalink,
      required this.quantity,
      required this.price,
      required this.lineTotal,
      required this.isValid,
      required this.productMeta,
      required this.selectedOptions,
      required this.variant,
      required this.image,
      required this.tax});

  @override
  List<Object?> get props => [
        id,
        productId,
        name,
        productName,
        sku,
        permalink,
        quantity,
        price,
        lineTotal,
        isValid,
        productMeta,
        selectedOptions,
        variant,
        image,
        tax
      ];
}
