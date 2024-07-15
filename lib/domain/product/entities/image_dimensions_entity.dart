// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ImageDimensionsEntity extends Equatable {
  int width;
  int height;

  ImageDimensionsEntity({
    required this.width,
    required this.height,
  });

  @override
  List<Object?> get props => [width, height];
}
