import 'package:json_annotation/json_annotation.dart';

part "spoken_languages.g.dart";

@JsonSerializable()  
class SpokenLanguages {
  String iso6391;
  String name;

  SpokenLanguages(this.iso6391, this.name);

  dynamic toJson() => _$SpokenLanguagesToJson(this);  
  factory SpokenLanguages.fromJson(Map<String, dynamic> obj) => _$SpokenLanguagesFromJson(obj);
}