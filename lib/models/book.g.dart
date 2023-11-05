// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book()
  ..bid = json['bid'] as num
  ..bookName = json['bookName'] as String
  ..wid = json['wid'] as num
  ..tid = json['tid'] as num
  ..bookPic = json['bookPic'] as String
  ..typeName = json['typeName'] as String
  ..writeName = json['writeName'] as String;

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'bid': instance.bid,
      'bookName': instance.bookName,
      'wid': instance.wid,
      'tid': instance.tid,
      'bookPic': instance.bookPic,
      'typeName': instance.typeName,
      'writeName': instance.writeName,
    };
