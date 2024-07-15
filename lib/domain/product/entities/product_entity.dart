// ignore_for_file: must_be_immutable

import 'package:app_shoes_ecommerce/domain/product/entities/conditionals_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/image_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/inventory_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/price_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/variant_group_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  String id;
  int? created;
  int? updated;
  bool active;
  String? permalink;
  String name;
  String? description;
  PriceEntity price;
  InventoryEntity? inventory;
  String? sku;
  int? sortOrder;
  ConditionalsEntity conditionals;
  bool? taxExempt;
  bool? payWhatYouWant;
  bool? inventoryManaged;
  bool soldOut;
  bool? images;
  List<dynamic>? categories;
  ImageEntity? image;
  List<ImageEntity>? assets;
  List<VariantGroupEntity>? variantGroup;

  ProductEntity(
      {required this.id,
      this.created,
      this.updated,
      required this.active,
      this.permalink,
      required this.name,
      this.description,
      required this.price,
      this.inventory,
      this.sku,
      this.sortOrder,
      required this.conditionals,
      this.taxExempt,
      this.payWhatYouWant,
      this.inventoryManaged,
      required this.soldOut,
      this.images,
      this.categories,
      required this.image,
      this.assets,
      this.variantGroup});

  @override
  List<Object?> get props => [
        id,
        created,
        updated,
        active,
        permalink,
        name,
        description,
        price,
        inventory,
        sku,
        sortOrder,
        conditionals,
        taxExempt,
        payWhatYouWant,
        inventoryManaged,
        soldOut,
        images,
        image,
        assets
      ];
}
