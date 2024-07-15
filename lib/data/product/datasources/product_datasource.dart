import 'package:app_shoes_ecommerce/core/network/api_provider.dart';
import 'package:app_shoes_ecommerce/core/utilities/end_point.dart';
import 'package:app_shoes_ecommerce/data/product/models/product_model.dart';
import 'package:app_shoes_ecommerce/domain/product/repository/product_repository.dart';

abstract class ProductDatasource {
  Future<ProductModel> getProductModel(ProductParams productParams);
  Future<List<ProductModel>> getListProductModel();
}

class ProductDatasourceImpl implements ProductDatasource {
  final APIProvider apiProvider;
  const ProductDatasourceImpl({required this.apiProvider});

  @override
  Future<List<ProductModel>> getListProductModel() async {
    print('ProductDataSource: GET ALL PRODUCTS');

    final response = await apiProvider.get(endPoint: productsEndPoint);
    List<dynamic> data = response.data['data'];

    return data.map((value) => ProductModel.fromJson(value)).toList();
  }

  @override
  Future<ProductModel> getProductModel(ProductParams productParams) async {
    final response = await apiProvider
        .get(endPoint: '/products/${productParams.id}', query: {'type': 'id'});

    return ProductModel.fromJson(response.data);
  }
}
