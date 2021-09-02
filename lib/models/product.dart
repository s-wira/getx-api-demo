import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:getx_api_demo/models/product_color.dart';

part 'product.g.dart';

@JsonSerializable(nullable: true)
class Product {
  int id;
  String brand;
  String name;
  String price;

  /// Jika nama variabel berbeda dengan nama element yang akan difetch dari response API
  /// Gunakan annotation JsonKey seperti beriku
  @JsonKey(name: "price_sign")
  String priceSign;
  String currency;
  @JsonKey(name: "image_link")
  String imageLink;
  @JsonKey(name: "product_link")
  String productLink;
  @JsonKey(name: "website_link")
  String websiteLink;
  String description;
  double rating;
  String category;
  @JsonKey(name: "product_type")
  String productType;
  @JsonKey(name: "tag_list")
  List<String> tagList;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "product_api_url")
  String productApiUrl;
  @JsonKey(name: "api_featured_image")
  String apiFeaturedImage;
  @JsonKey(name: "product_colors")
  List<ProductColor> productColors;

  /// Jika memiliki variabel yang tidak terkait dengan response API json
  /// Gunakan annotation seperti berikut
  @JsonKey(ignore: true)
  bool isFavorite;
  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
    this.isFavorite = false,
  });

  Product copyWith({
    int id,
    String brand,
    String name,
    String price,
    String priceSign,
    String currency,
    String imageLink,
    String productLink,
    String websiteLink,
    String description,
    double rating,
    String category,
    String productType,
    List<String> tagList,
    DateTime createdAt,
    DateTime updatedAt,
    String productApiUrl,
    String apiFeaturedImage,
    List<ProductColor> productColors,
    bool isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      name: name ?? this.name,
      price: price ?? this.price,
      priceSign: priceSign ?? this.priceSign,
      currency: currency ?? this.currency,
      imageLink: imageLink ?? this.imageLink,
      productLink: productLink ?? this.productLink,
      websiteLink: websiteLink ?? this.websiteLink,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      category: category ?? this.category,
      productType: productType ?? this.productType,
      tagList: tagList ?? this.tagList,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productApiUrl: productApiUrl ?? this.productApiUrl,
      apiFeaturedImage: apiFeaturedImage ?? this.apiFeaturedImage,
      productColors: productColors ?? this.productColors,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  String toString() {
    return 'Product(id: $id, brand: $brand, name: $name, price: $price, priceSign: $priceSign, currency: $currency, imageLink: $imageLink, productLink: $productLink, websiteLink: $websiteLink, description: $description, rating: $rating, category: $category, productType: $productType, tagList: $tagList, createdAt: $createdAt, updatedAt: $updatedAt, productApiUrl: $productApiUrl, apiFeaturedImage: $apiFeaturedImage, productColors: $productColors, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.brand == brand &&
        other.name == name &&
        other.price == price &&
        other.priceSign == priceSign &&
        other.currency == currency &&
        other.imageLink == imageLink &&
        other.productLink == productLink &&
        other.websiteLink == websiteLink &&
        other.description == description &&
        other.rating == rating &&
        other.category == category &&
        other.productType == productType &&
        listEquals(other.tagList, tagList) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.productApiUrl == productApiUrl &&
        other.apiFeaturedImage == apiFeaturedImage &&
        listEquals(other.productColors, productColors) &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        brand.hashCode ^
        name.hashCode ^
        price.hashCode ^
        priceSign.hashCode ^
        currency.hashCode ^
        imageLink.hashCode ^
        productLink.hashCode ^
        websiteLink.hashCode ^
        description.hashCode ^
        rating.hashCode ^
        category.hashCode ^
        productType.hashCode ^
        tagList.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        productApiUrl.hashCode ^
        apiFeaturedImage.hashCode ^
        productColors.hashCode ^
        isFavorite.hashCode;
  }
}
