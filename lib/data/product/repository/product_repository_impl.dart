import 'package:app_shoes_ecommerce/core/error/error_handler.dart';
import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/data/product/datasources/product_datasource.dart';
import 'package:app_shoes_ecommerce/domain/product/entities/product_entity.dart';
import 'package:app_shoes_ecommerce/domain/product/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource productDatasource;

  ProductRepositoryImpl({required this.productDatasource});

  @override
  Future<Either<Failure, ProductEntity>> getProduct(
      ProductParams productParams) async {
    try {
      final data = await productDatasource.getProductModel(productParams);
      return right(data);
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getListProduct() async {
    try {
      final data = await productDatasource.getListProductModel();
      return right(data);
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  }
}
