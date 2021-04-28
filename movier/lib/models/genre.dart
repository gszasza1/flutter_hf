

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