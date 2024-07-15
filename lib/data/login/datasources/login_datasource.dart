import 'package:app_shoes_ecommerce/core/network/api_provider.dart';
import 'package:app_shoes_ecommerce/core/utilities/end_point.dart';
import 'package:app_shoes_ecommerce/data/login/models/login_model.dart';
import 'package:app_shoes_ecommerce/domain/login/respository/login_repository.dart';

abstract class LoginDatasource {
  Future<LoginModel> login(LoginParams loginParams);
}

class LoginDatasourceImpl implements LoginDatasource {
  final APIProvider apiProvider;

  LoginDatasourceImpl({required this.apiProvider});

  @override
  Future<LoginModel> login(LoginParams loginParams) async {
    final response = await apiProvider.post(
        endPoint: loginEndPoint,
        data: {'email': loginParams.email, 'password': loginParams.password});
    return LoginModel.fromJson(response.data);
  }
}
