import 'package:json_annotation/json_annotation.dart';

part "production_countries.g.dart";

@JsonSerializable()  
class ProductionCountries {
  String? iso_3166_1;
  String name;

  ProductionCountries(this.iso_3166_1, this.name);

  dynamic toJson() => _$ProductionCountriesToJson(this);  
  factory ProductionCountries.fromJson(Map<String, dynamic> obj) => _$ProductionCountriesFromJson(obj);

}