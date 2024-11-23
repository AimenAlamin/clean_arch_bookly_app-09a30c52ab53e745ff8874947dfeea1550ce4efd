import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchNewestdBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;
  FetchNewestdBooksUseCase(this.homeRepo);
  @override
  Future<List<BookEntity>> call([void param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
