// ignore_for_file: must_be_immutable

import 'package:app_shoes_ecommerce/domain/product/entities/image_dimensions_entity.dart';
import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  String? id;
  String? url;
  String? description;
  bool? isImage;
  String? filename;
  int fileSize;
  String? fileExtension;
  ImageDimensionsEntity imageDimensions;
  List<dynamic> meta;
  int createdAt;
  int updatedAt;

  ImageEntity({
    required this.id,
    required this.url,
    required this.description,
    required this.isImage,
    required this.filename,
    required this.fileSize,
    required this.fileExtension,
    required this.imageDimensions,
    required this.meta,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        description,
        isImage,
        filename,
        fileSize,
        fileExtension,
        imageDimensions,
        meta,
        createdAt,
        updatedAt
      ];
}
