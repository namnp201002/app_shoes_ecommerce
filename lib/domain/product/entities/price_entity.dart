// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class PriceEntity extends Equatable {
  double? raw;
  String? formatted;
  String? formattedWithSymbol;
  String? formattedWithCode;

  PriceEntity({
    required this.raw,
    required this.formatted,
    required this.formattedWithSymbol,
    required this.formattedWithCode,
  });

  @override
  List<Object?> get props =>
      [raw, formatted, formattedWithSymbol, formattedWithCode];
}
