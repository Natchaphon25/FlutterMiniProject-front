import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  Book();

  late num bid;
  late String bookName;
  late num wid;
  late num tid;
  late String bookPic;
  late String typeName;
  late String writeName;
  
  factory Book.fromJson(Map<String,dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
