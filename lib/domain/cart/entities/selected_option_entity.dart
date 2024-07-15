import 'package:app_shoes_ecommerce/domain/product/entities/price_entity.dart';

class SelectedOptionEntity {
  final String groupId;
  final String groupName;
  final String optionId;
  final String optionName;
  final PriceEntity price;

  const SelectedOptionEntity({
    required this.groupId,
    required this.groupName,
    required this.optionId,
    required this.optionName,
    required this.price,
  });
}
