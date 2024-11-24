import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_book_state.dart';

// class NewestBookCubit extends Cubit<NewestBookState> {
//   NewestBookCubit() : super(NewestBookInitial());
// }
class NewestBooksCubit extends Cubit<NewestBookState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestdBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBoooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) => emit(NewestBooksFailed(message: failure.message)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
