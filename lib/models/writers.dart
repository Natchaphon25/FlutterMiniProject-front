import 'package:json_annotation/json_annotation.dart';
import "writer.dart";
part 'writers.g.dart';

@JsonSerializable()
class Writers {
  Writers();

  late List<Writer> writers=[];
  
  factory Writers.fromJson(Map<String,dynamic> json) => _$WritersFromJson(json);
  Map<String, dynamic> toJson() => _$WritersToJson(this);
}
