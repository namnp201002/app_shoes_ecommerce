// ignore_for_file: must_be_immutable

import 'package:app_shoes_ecommerce/domain/product/entities/conditionals_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/image_dimensions_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/image_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/inventory_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/option_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/price_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/variant_group_entity.dart';

class PriceModel extends PriceEntity {
  PriceModel(
      {required super.raw,
      required super.formatted,
      required super.formattedWithSymbol,
      required super.formattedWithCode});
  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
        raw: json['raw'].toDouble(),
        formatted: json['formatted'],
        formattedWithSymbol: json['formatted_with_symbol'],
        formattedWithCode: json['formatted_with_code']);
  }
}

class InventoryModel extends InventoryEntity {
  InventoryModel({required super.managed, required super.available});
  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      managed: json['managed'],
      available: json['available'],
    );
  }
}

class ImageModel extends ImageEntity {
  ImageModel(
      {required super.id,
      required super.url,
      required super.isImage,
      required super.filename,
      required super.description,
      required super.fileSize,
      required super.fileExtension,
      required super.imageDimensions,
      required super.meta,
      required super.createdAt,
      required super.updatedAt});
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      url: json['url'],
      description: json['description'],
      isImage: json['is_image'],
      filename: json['filename'],
      fileSize: json['file_size'],
      fileExtension: json['file_extension'],
      imageDimensions: ImageDimensionsModel.fromJson(json['image_dimensions']),
      meta: List<dynamic>.from(json['meta']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class ImageDimensionsModel extends ImageDimensionsEntity {
  ImageDimensionsModel({required super.width, required super.height});

  factory ImageDimensionsModel.fromJson(Map<String, dynamic> json) {
    return ImageDimensionsModel(
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
    };
  }
}

class OptionModel extends OptionEntity {
  OptionModel(
      {required super.id,
      required super.name,
      required super.price,
      required super.assets,
      required super.created,
      required super.updated});

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
        id: json['id'],
        name: json['name'],
        price: PriceModel.fromJson(json['price']),
        assets: List<dynamic>.from(json['assets']),
        created: json['created'],
        updated: json['updated']);
  }
}

class VariantGroupModel extends VariantGroupEntity {
  VariantGroupModel(
      {required super.id,
      required super.name,
      required super.created,
      required super.updated,
      required super.options});

  factory VariantGroupModel.fromJson(Map<String, dynamic> json) {
    return VariantGroupModel(
        id: json['id'],
        name: json['name'],
        created: json['created'],
        updated: json['updated'],
        options: (json['options'] as List)
            .map((e) => OptionModel.fromJson(e))
            .toList());
  }
}

class ConditionalsModel extends ConditionalsEntity {
  ConditionalsModel(
      {required super.isActive,
      required super.isTaxExempt,
      required super.isPayWhatYouWant,
      required super.isInventoryManaged,
      required super.isSoldOut,
      required super.hasDigitalDelivery,
      required super.hasPhysicalDelivery,
      required super.hasImages,
      required super.collectsFullname,
      required super.collectsShippingAddress,
      required super.collectsBillingAddress,
      required super.collectsExtraFields});
  factory ConditionalsModel.fromJson(Map<String, dynamic> json) {
    return ConditionalsModel(
      isActive: json['is_active'],
      isTaxExempt: json['is_tax_exempt'],
      isPayWhatYouWant: json['is_pay_what_you_want'],
      isInventoryManaged: json['is_inventory_managed'],
      isSoldOut: json['is_sold_out'],
      hasDigitalDelivery: json['has_digital_delivery'],
      hasPhysicalDelivery: json['has_physical_delivery'],
      hasImages: json['has_images'],
      collectsFullname: json['collects_fullname'],
      collectsShippingAddress: json['collects_shipping_address'],
      collectsBillingAddress: json['collects_billing_address'],
      collectsExtraFields: json['collects_extra_fields'],
    );
  }
}

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      super.created,
      super.updated,
      required super.active,
      super.permalink,
      required super.name,
      super.description,
      required super.price,
      super.inventory,
      super.sku,
      super.sortOrder,
      required super.conditionals,
      super.taxExempt,
      super.payWhatYouWant,
      super.inventoryManaged,
      required super.soldOut,
      super.images,
      super.image,
      super.categories,
      super.assets,
      super.variantGroup});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        created: json['created'],
        updated: json['updated'],
        active: json['active'],
        permalink: json['permalink'],
        name: json['name'],
        description: json['description'],
        price: PriceModel.fromJson(json['price']),
        inventory: InventoryModel.fromJson(json['inventory']),
        sku: json['sku'],
        sortOrder: json['sort_order'],
        conditionals: ConditionalsModel.fromJson(json['conditionals']),
        taxExempt: json['is']['tax_exempt'],
        payWhatYouWant: json['is']['pay_what_you_want'],
        inventoryManaged: json['is']['inventory_managed'],
        soldOut: json['is']['sold_out'],
        images: json['has']['images'],
        categories: List<dynamic>.from(json['categories']),
        image:
            json['image'] != null ? ImageModel.fromJson(json['image']) : null,
        assets: ((json['assets'] ?? []) as List)
            .map((item) => ImageModel.fromJson(item))
            .toList(),
        variantGroup: ((json['variant_groups'] ?? []) as List)
            .map((e) => VariantGroupModel.fromJson(e))
            .toList());
  }
}
