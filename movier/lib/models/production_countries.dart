import 'package:json_annotation/json_annotation.dart';

part "production_countries.g.dart";

@JsonSerializable()  
class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries(this.iso31661, this.name);

  dynamic toJson() => _$ProductionCountriesToJson(this);  
  factory ProductionCountries.fromJson(Map<String, dynamic> obj) => _$ProductionCountriesFromJson(obj);

}