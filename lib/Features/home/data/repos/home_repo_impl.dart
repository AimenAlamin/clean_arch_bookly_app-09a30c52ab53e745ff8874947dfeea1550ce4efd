import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  HomeRepoImpl({required this.remoteDataSource, required this.localDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      // List<BookEntity> books;
      // books = localDataSource.fetchFeaturedBooks();
      // if (books.isNotEmpty) {
      //   return right(books);
      // }
      // books = await remoteDataSource.fetchFeaturedBooks();
      // return right(books);
      var localBooks = localDataSource.fetchFeaturedBooks();
      if (localBooks.isNotEmpty) {
        return Right(localBooks);
      }
      var remoteBooks = await remoteDataSource.fetchFeaturedBooks();
      return Right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var localBooks = localDataSource.fetchNewestBooks();
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }
      var remoteBooks = await remoteDataSource.fetchNewestBooks();
      return Right(remoteBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
