// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genres {
  int id;
  String name;

  Genres(this.id, this.name);

  dynamic toJson() => _$GenresToJson(this);
  factory Genres.fromJson(Map<String, dynamic> obj) => _$GenresFromJson(obj);
}
