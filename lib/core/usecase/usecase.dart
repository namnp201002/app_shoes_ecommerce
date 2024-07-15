import 'package:app_shoes_ecommerce/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class BaseUsecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
