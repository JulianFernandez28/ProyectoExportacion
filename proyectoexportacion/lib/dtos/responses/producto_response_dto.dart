import 'package:meta/meta.dart';
import 'dart:convert';

ProductResponseDto productResponseDtoFromJson(String str) => ProductResponseDto.fromJson(json.decode(str));

String productResponseDtoToJson(ProductResponseDto data) => json.encode(data.toJson());

class ProductResponseDto {
    ProductResponseDto({
        required this.id,
        required this.name,
    });

    final int id;
    final String name;

    factory ProductResponseDto.fromJson(Map<String, dynamic> json) => ProductResponseDto(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}