// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapters _$ChaptersFromJson(Map<String, dynamic> json) => Chapters()
  ..chapters = (json['chapters'] as List<dynamic>)
      .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ChaptersToJson(Chapters instance) => <String, dynamic>{
      'chapters': instance.chapters,
    };
