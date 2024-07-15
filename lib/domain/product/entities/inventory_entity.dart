// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class InventoryEntity extends Equatable {
  bool? managed;
  int available;

  InventoryEntity({
    required this.managed,
    required this.available,
  });

  @override
  List<Object?> get props => [managed, available];
}
