// ignore_for_file: must_be_immutable

import 'package:app_shoes_ecommerce/domain/product/entities/price_entity.dart';
import 'package:equatable/equatable.dart';

class OptionEntity extends Equatable {
  String id;
  String name;
  PriceEntity price;
  List<dynamic> assets;
  dynamic meta;
  int created;
  int updated;
  OptionEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.assets,
    this.meta,
    required this.created,
    required this.updated,
  });

  @override
  List<Object?> get props => [id, name, price, assets, meta, created, updated];
}
