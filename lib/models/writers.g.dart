// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'writers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Writers _$WritersFromJson(Map<String, dynamic> json) => Writers()
  ..writers = (json['writers'] as List<dynamic>)
      .map((e) => Writer.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$WritersToJson(Writers instance) => <String, dynamic>{
      'writers': instance.writers,
    };
