// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductColor _$ProductColorFromJson(Map<String, dynamic> json) {
  return ProductColor(
    hexValue: json['hex_value'] as String,
    colourName: json['colour_name'] as String,
  );
}

Map<String, dynamic> _$ProductColorToJson(ProductColor instance) =>
    <String, dynamic>{
      'hex_value': instance.hexValue,
      'colour_name': instance.colourName,
    };
