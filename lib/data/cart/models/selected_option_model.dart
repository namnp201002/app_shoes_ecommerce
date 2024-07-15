import 'package:app_shoes_ecommerce/data/product/models/product_model.dart';
import 'package:app_shoes_ecommerce/domain/cart/entities/selected_option_entity.dart';

class SelectedOptionModel extends SelectedOptionEntity {
  const SelectedOptionModel(
      {required super.groupId,
      required super.groupName,
      required super.optionId,
      required super.optionName,
      required super.price});
  factory SelectedOptionModel.fromJson(Map<String, dynamic> json) {
    return SelectedOptionModel(
        groupId: json['group_id'],
        groupName: json['group_name'],
        optionId: json['option_id'],
        optionName: json['option_name'],
        price: PriceModel.fromJson(json['price']));
  }
}
