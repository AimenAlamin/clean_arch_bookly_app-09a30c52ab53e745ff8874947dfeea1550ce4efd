import 'package:bookly/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchNewestdBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;
  FetchNewestdBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) async {
    // check permssion
    return await homeRepo.fetchNewestBooks();
  }
}
