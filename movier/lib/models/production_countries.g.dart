// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCountries _$ProductionCountriesFromJson(Map<String, dynamic> json) {
  return ProductionCountries(
    json['iso31661'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ProductionCountriesToJson(
        ProductionCountries instance) =>
    <String, dynamic>{
      'iso31661': instance.iso31661,
      'name': instance.name,
    };
