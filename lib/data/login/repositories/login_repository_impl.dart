import 'package:app_shoes_ecommerce/core/error/error_handler.dart';
import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/data/login/datasources/login_datasource.dart';
import 'package:app_shoes_ecommerce/domain/login/entity/login_entity.dart';
import 'package:app_shoes_ecommerce/domain/login/respository/login_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepositoryImpl implements LoginBaseRepository {
  final LoginDatasource loginDatasource;

  LoginRepositoryImpl({required this.loginDatasource});

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParams loginParams) async {
    try {
      final response = await loginDatasource.login(loginParams);
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
