import 'package:json_annotation/json_annotation.dart';
import "chapter.dart";
part 'chapters.g.dart';

@JsonSerializable()
class Chapters {
  Chapters();

  late List<Chapter> chapters=[];
  
  factory Chapters.fromJson(Map<String,dynamic> json) => _$ChaptersFromJson(json);
  Map<String, dynamic> toJson() => _$ChaptersToJson(this);
}
