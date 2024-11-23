import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/use_cases/use_case.dart';

import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);
  Future<List<BookEntity>> fetchFeaturedBooks() {
    // check permssion
    return homeRepo.fetchFeaturedBooks();
  }

  @override
  Future<List<BookEntity>> call([void param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
