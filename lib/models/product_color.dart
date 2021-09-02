import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'product_color.g.dart';

@JsonSerializable(nullable: true)
class ProductColor {
  @JsonKey(name: "hex_value")
  String hexValue;
  @JsonKey(name: "colour_name")
  String colourName;
  ProductColor({
    this.hexValue,
    this.colourName,
  });

  ProductColor copyWith({
    String hexValue,
    String colourName,
  }) {
    return ProductColor(
      hexValue: hexValue ?? this.hexValue,
      colourName: colourName ?? this.colourName,
    );
  }

  Map<String, dynamic> toJson() => _$ProductColorToJson(this);

  factory ProductColor.fromJson(Map<String, dynamic> json) =>
      _$ProductColorFromJson(json);

  @override
  String toString() =>
      'ProductColor(hexValue: $hexValue, colourName: $colourName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductColor &&
        other.hexValue == hexValue &&
        other.colourName == colourName;
  }

  @override
  int get hashCode => hexValue.hashCode ^ colourName.hashCode;
}
