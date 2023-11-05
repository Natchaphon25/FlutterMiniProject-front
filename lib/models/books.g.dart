// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Books _$BooksFromJson(Map<String, dynamic> json) => Books()
  ..books = (json['books'] as List<dynamic>)
      .map((e) => Book.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$BooksToJson(Books instance) => <String, dynamic>{
      'books': instance.books,
    };
