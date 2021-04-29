// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part "spoken_languages.g.dart";

@JsonSerializable()
class SpokenLanguages {
  String? iso_639_1;
  String name;

  SpokenLanguages(this.iso_639_1, this.name);

  dynamic toJson() => _$SpokenLanguagesToJson(this);
  factory SpokenLanguages.fromJson(Map<String, dynamic> obj) =>
      _$SpokenLanguagesFromJson(obj);
}
