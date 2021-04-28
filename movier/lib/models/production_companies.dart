import 'package:json_annotation/json_annotation.dart';


part "production_companies.g.dart";

@JsonSerializable()  
class ProductionCompanies {
  String name;
  int id;
  String logoPath;
  String originCountry;

  ProductionCompanies(this.name, this.id, this.logoPath, this.originCountry);
  dynamic toJson() => _$ProductionCompaniesToJson(this);  
  factory ProductionCompanies.fromJson(Map<String, dynamic> obj) => _$ProductionCompaniesFromJson(obj);

}