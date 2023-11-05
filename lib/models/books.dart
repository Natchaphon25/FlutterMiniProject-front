import 'package:json_annotation/json_annotation.dart';
import "book.dart";
part 'books.g.dart';

@JsonSerializable()
class Books {
  Books();

  late List<Book> books=[];
  
  factory Books.fromJson(Map<String,dynamic> json) => _$BooksFromJson(json);
  Map<String, dynamic> toJson() => _$BooksToJson(this);
}
