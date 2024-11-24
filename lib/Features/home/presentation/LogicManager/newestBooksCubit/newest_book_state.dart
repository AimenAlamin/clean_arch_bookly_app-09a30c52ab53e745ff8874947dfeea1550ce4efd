part of 'newest_book_cubit.dart';

@immutable
abstract class NewestBookState {}

class NewestBooksInitial extends NewestBookState {}

class NewestBoooksLoading extends NewestBookState {}

class NewestBooksFailed extends NewestBookState {
  final String message;
  NewestBooksFailed({required this.message});
}

class NewestBooksSuccess extends NewestBookState {
  final List<BookEntity> books;
  NewestBooksSuccess({required this.books});
}
