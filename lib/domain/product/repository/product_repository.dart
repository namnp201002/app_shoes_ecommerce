import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductEntity>> getProduct(
      ProductParams productParams);
  Future<Either<Failure, List<ProductEntity>>> getListProduct();
}

class ProductParams {
  final String id;

  ProductParams({required this.id});
}
