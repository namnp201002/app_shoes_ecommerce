import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:app_shoes_ecommerce/core/usecase/usecase.dart';
import 'package:app_shoes_ecommerce/domain/login/entity/login_entity.dart';
import 'package:app_shoes_ecommerce/domain/login/respository/login_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUseCase extends BaseUsecase<LoginEntity, LoginUseCaseParams> {
  final LoginBaseRepository loginBaseRepository;

  LoginUseCase({required this.loginBaseRepository});

  @override
  Future<Either<Failure, LoginEntity>> call(LoginUseCaseParams params) async {
    return await loginBaseRepository
        .login(LoginParams(email: params.email, password: params.password));
  }
}

class LoginUseCaseParams {
  final String email;
  final String password;

  LoginUseCaseParams({required this.email, required this.password});
}
