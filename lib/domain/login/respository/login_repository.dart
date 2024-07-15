import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/domain/login/entity/login_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoginBaseRepository {
  Future<Either<Failure, LoginEntity>> login(LoginParams loginParams);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
