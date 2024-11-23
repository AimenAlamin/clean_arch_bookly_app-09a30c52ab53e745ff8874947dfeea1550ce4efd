import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
}
