// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    brand: json['brand'] as String,
    name: json['name'] as String,
    price: json['price'] as String,
    priceSign: json['price_sign'] as String,
    currency: json['currency'] as String,
    imageLink: json['image_link'] as String,
    productLink: json['product_link'] as String,
    websiteLink: json['website_link'] as String,
    description: json['description'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    category: json['category'] as String,
    productType: json['product_type'] as String,
    tagList: (json['tag_list'] as List)?.map((e) => e as String)?.toList(),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    productApiUrl: json['product_api_url'] as String,
    apiFeaturedImage: json['api_featured_image'] as String,
    productColors: (json['product_colors'] as List)
        ?.map((e) =>
            e == null ? null : ProductColor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'name': instance.name,
      'price': instance.price,
      'price_sign': instance.priceSign,
      'currency': instance.currency,
      'image_link': instance.imageLink,
      'product_link': instance.productLink,
      'website_link': instance.websiteLink,
      'description': instance.description,
      'rating': instance.rating,
      'category': instance.category,
      'product_type': instance.productType,
      'tag_list': instance.tagList,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'product_api_url': instance.productApiUrl,
      'api_featured_image': instance.apiFeaturedImage,
      'product_colors': instance.productColors,
    };
