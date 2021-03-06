// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part "production_companies.g.dart";

@JsonSerializable()
class ProductionCompanies {
  String? name;
  int id;
  String? logo_path;
  String? origin_country;

  ProductionCompanies(this.name, this.id, this.logo_path, this.origin_country);
  dynamic toJson() => _$ProductionCompaniesToJson(this);
  factory ProductionCompanies.fromJson(Map<String, dynamic> obj) =>
      _$ProductionCompaniesFromJson(obj);
}
