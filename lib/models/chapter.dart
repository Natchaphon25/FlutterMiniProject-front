import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  Chapter();

  late num chid;
  late num bid;
  late num chNum;
  late String chName;
  late String content;
  
  factory Chapter.fromJson(Map<String,dynamic> json) => _$ChapterFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}
