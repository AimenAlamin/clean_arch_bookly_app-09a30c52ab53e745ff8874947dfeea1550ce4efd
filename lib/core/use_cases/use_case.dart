import 'package:dartz/dartz.dart';

import '../errors/faliure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}
