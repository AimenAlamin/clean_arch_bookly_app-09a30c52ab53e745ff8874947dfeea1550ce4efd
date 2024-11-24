import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void cacheBooksData(
    {required List<BookEntity> boxBookList, required String boxName}) {
  var box = Hive.box(boxName);
  box.addAll(boxBookList);
}
