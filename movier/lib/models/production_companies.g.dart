// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanies _$ProductionCompaniesFromJson(Map<String, dynamic> json) {
  return ProductionCompanies(
    json['name'] as String,
    json['id'] as int,
    json['logoPath'] as String,
    json['originCountry'] as String,
  );
}

Map<String, dynamic> _$ProductionCompaniesToJson(
        ProductionCompanies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'logoPath': instance.logoPath,
      'originCountry': instance.originCountry,
    };
