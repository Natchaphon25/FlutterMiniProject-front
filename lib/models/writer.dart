import 'package:json_annotation/json_annotation.dart';

part 'writer.g.dart';

@JsonSerializable()
class Writer {
  Writer();

  late num wid;
  late String writeName;
  
  factory Writer.fromJson(Map<String,dynamic> json) => _$WriterFromJson(json);
  Map<String, dynamic> toJson() => _$WriterToJson(this);
}
