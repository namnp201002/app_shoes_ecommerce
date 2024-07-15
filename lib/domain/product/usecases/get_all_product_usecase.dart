import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/core/usecase/usecase.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllProductUseCase extends BaseUsecase<List<ProductEntity>, NoParams> {
  final ProductRepository productRepository;

  GetAllProductUseCase({required this.productRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await productRepository.getListProduct();
  }
}
