// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  String? backdrop_path = "";
  int id;
  String? poster_path = "";
  String? name = "";

  Collection({
    required this.backdrop_path,
    required this.id,
    required this.poster_path,
    required this.name,
  });

  factory Collection.createInitDetailedMovie() {
    return Collection(
      backdrop_path: "",
      id: 0,
      name: "",
      poster_path: "",
    );
  }
  dynamic toJson() => _$CollectionToJson(this);
  factory Collection.fromJson(Map<String, dynamic> obj) =>
      _$CollectionFromJson(obj);
}
