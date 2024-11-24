part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBoooksLoading extends FeaturedBooksState {}

class FeaturedBooksFailed extends FeaturedBooksState {
  final String message;
  FeaturedBooksFailed({required this.message});
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
  FeaturedBooksSuccess({required this.books});
}
