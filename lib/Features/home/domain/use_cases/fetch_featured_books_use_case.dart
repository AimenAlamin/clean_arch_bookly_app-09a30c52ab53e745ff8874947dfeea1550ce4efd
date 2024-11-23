import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/errors/faliure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) async {
    // check permssion
    return await homeRepo.fetchFeaturedBooks();
  }
}
