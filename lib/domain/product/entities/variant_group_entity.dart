// ignore_for_file: must_be_immutable

import 'package:app_shoes_ecommerce/domain/product/entities/option_entity.dart';
import 'package:equatable/equatable.dart';

class VariantGroupEntity extends Equatable {
  String id;
  String name;
  dynamic meta;
  int created;
  int updated;
  List<OptionEntity> options;

  VariantGroupEntity({
    required this.id,
    required this.name,
    this.meta,
    required this.created,
    required this.updated,
    required this.options,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
