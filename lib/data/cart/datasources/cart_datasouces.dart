import 'package:app_shoes_ecommerce/core/network/api_provider.dart';
import 'package:app_shoes_ecommerce/data/cart/models/line_item_model.dart';
import 'package:app_shoes_ecommerce/domain/cart/entities/line_item_entity.dart';
import 'package:app_shoes_ecommerce/domain/cart/repository/cart_repository.dart';

abstract class CartDatasource {
  Future<List<LineItemEntity>> getAllItemsInCart(CartParams cartParams);
  Future<bool> addItemToCart();
}

class CartDataSourceImpl implements CartDatasource {
  final APIProvider apiProvider;

  CartDataSourceImpl({required this.apiProvider});
  @override
  Future<bool> addItemToCart() async {
    throw UnimplementedError();
  }

  @override
  Future<List<LineItemEntity>> getAllItemsInCart(CartParams cartParams) async {
    final response = await apiProvider.get(endPoint: '/carts/${cartParams.id}');
    return (response.data['line_items'] as List)
        .map((e) => LineItemModel.fromJson(e))
        .toList();
  }
}
