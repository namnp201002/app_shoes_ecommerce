// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ConditionalsEntity extends Equatable {
  bool? isActive;
  bool? isTaxExempt;
  bool? isPayWhatYouWant;
  bool? isInventoryManaged;
  bool? isSoldOut;
  bool? hasDigitalDelivery;
  bool? hasPhysicalDelivery;
  bool? hasImages;
  bool? collectsFullname;
  bool? collectsShippingAddress;
  bool? collectsBillingAddress;
  bool? collectsExtraFields;

  ConditionalsEntity({
    required this.isActive,
    required this.isTaxExempt,
    required this.isPayWhatYouWant,
    required this.isInventoryManaged,
    required this.isSoldOut,
    required this.hasDigitalDelivery,
    required this.hasPhysicalDelivery,
    required this.hasImages,
    required this.collectsFullname,
    required this.collectsShippingAddress,
    required this.collectsBillingAddress,
    required this.collectsExtraFields,
  });

  @override
  List<Object?> get props => [
        isActive,
        isTaxExempt,
        isPayWhatYouWant,
        isInventoryManaged,
        isSoldOut,
        hasDigitalDelivery,
        hasPhysicalDelivery,
        hasImages,
        collectsFullname,
        collectsShippingAddress,
        collectsBillingAddress,
        collectsExtraFields
      ];
}
