// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter()
  ..chid = json['chid'] as num
  ..bid = json['bid'] as num
  ..chNum = json['chNum'] as num
  ..chName = json['chName'] as String
  ..content = json['content'] as String;

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'chid': instance.chid,
      'bid': instance.bid,
      'chNum': instance.chNum,
      'chName': instance.chName,
      'content': instance.content,
    };
