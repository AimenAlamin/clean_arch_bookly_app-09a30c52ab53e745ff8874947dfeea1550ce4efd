import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/Functions/caching_books.dart';
import 'package:bookly/core/utils/api_service.dart';

import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=programming');

    List<BookEntity> books = booksList(data);
    //Caching the data coming from the API
    cacheBooksData(
        boxBookList: books,
        boxName:
            KFeaturedBooks); //adding all the books list to the box collection(local storage)
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endpoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=programming");
    List<BookEntity> books = booksList(data);
    cacheBooksData(boxBookList: books, boxName: KNewestBooks);
    return books;
  }

  List<BookEntity> booksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
