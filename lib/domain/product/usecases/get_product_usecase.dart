import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/core/usecase/usecase.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductUsecase
    extends BaseUsecase<ProductEntity, ProductUsecaseParams> {
  final ProductRepository productRepository;

  GetProductUsecase({required this.productRepository});

  @override
  Future<Either<Failure, ProductEntity>> call(
      ProductUsecaseParams params) async {
    return await productRepository.getProduct(ProductParams(id: params.id));
  }
}

class ProductUsecaseParams {
  final String id;

  ProductUsecaseParams({required this.id});
}
