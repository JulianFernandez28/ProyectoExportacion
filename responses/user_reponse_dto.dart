// To parse this JSON data, do
//
//     final enviosDto = enviosDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EnviosDto enviosDtoFromJson(String str) => EnviosDto.fromJson(json.decode(str));

String enviosDtoToJson(EnviosDto data) => json.encode(data.toJson());

class EnviosDto {
  EnviosDto({
    required this.id,
    required this.title,
    required this.productId,
    required this.weightContent,
    required this.measures,
    required this.sourceLocation,
    required this.destinationLocation,
    required this.curpUserSubmit,
    required this.curpClient,
    required this.placaTransport,
    required this.user,
    required this.product,
    required this.reports,
    required this.status,
    required this.createOn,
    required this.updateOn,
  });

  final int id;
  final String title;
  final int productId;
  final String weightContent;
  final String measures;
  final String sourceLocation;
  final String destinationLocation;
  final String curpUserSubmit;
  final String curpClient;
  final String placaTransport;
  final dynamic user;
  final Product product;
  final dynamic reports;
  final dynamic status;
  final DateTime createOn;
  final DateTime updateOn;

  factory EnviosDto.fromJson(Map<String, dynamic> json) => EnviosDto(
        id: json["id"],
        title: json["title"],
        productId: json["productId"],
        weightContent: json["weightContent"],
        measures: json["measures"],
        sourceLocation: json["sourceLocation"],
        destinationLocation: json["destinationLocation"],
        curpUserSubmit: json["curpUserSubmit"],
        curpClient: json["curpClient"],
        placaTransport: json["placaTransport"],
        user: json["user"],
        product: Product.fromJson(json["product"]),
        reports: json["reports"],
        status: json["status"],
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "productId": productId,
        "weightContent": weightContent,
        "measures": measures,
        "sourceLocation": sourceLocation,
        "destinationLocation": destinationLocation,
        "curpUserSubmit": curpUserSubmit,
        "curpClient": curpClient,
        "placaTransport": placaTransport,
        "user": user,
        "product": product.toJson(),
        "reports": reports,
        "status": status,
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.createOn,
    required this.updateOn,
  });

  final int id;
  final String name;
  final int categoryId;
  final String image;
  final DateTime createOn;
  final DateTime updateOn;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        categoryId: json["categoryId"],
        image: json["image"],
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categoryId": categoryId,
        "image": image,
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
      };
}
