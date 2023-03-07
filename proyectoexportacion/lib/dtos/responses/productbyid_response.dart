// To parse this JSON data, do
//
//     final envioAllResponseDto = envioAllResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EnvioAllResponseDto envioAllResponseDtoFromJson(String str) =>
    EnvioAllResponseDto.fromJson(json.decode(str));

String envioAllResponseDtoToJson(EnvioAllResponseDto data) =>
    json.encode(data.toJson());

class EnvioAllResponseDto {
  EnvioAllResponseDto({
    required this.createOn,
    required this.updateOn,
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
  });

  final DateTime createOn;
  final DateTime updateOn;
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
  final User user;
  final Product product;
  final dynamic reports;
  final dynamic status;

  factory EnvioAllResponseDto.fromJson(Map<String, dynamic> json) =>
      EnvioAllResponseDto(
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
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
        user: User.fromJson(json["user"]),
        product: Product.fromJson(json["product"]),
        reports: json["reports"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
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
        "user": user.toJson(),
        "product": product.toJson(),
        "reports": reports,
        "status": status,
      };
}

class Product {
  Product({
    required this.createOn,
    required this.updateOn,
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
  });

  final DateTime createOn;
  final DateTime updateOn;
  final int id;
  final String name;
  final int categoryId;
  final String image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
        id: json["id"],
        name: json["name"],
        categoryId: json["categoryId"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
        "id": id,
        "name": name,
        "categoryId": categoryId,
        "image": image,
      };
}

class User {
  User({
    required this.createOn,
    required this.updateOn,
    required this.curp,
    required this.name,
    required this.lastName,
    required this.emailAddres,
    required this.password,
    required this.numberPhone,
    required this.rol,
    required this.envios,
  });

  final DateTime createOn;
  final DateTime updateOn;
  final String curp;
  final String name;
  final String lastName;
  final String emailAddres;
  final String password;
  final String numberPhone;
  final String rol;
  final dynamic envios;

  factory User.fromJson(Map<String, dynamic> json) => User(
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
        curp: json["curp"],
        name: json["name"],
        lastName: json["lastName"],
        emailAddres: json["emailAddres"],
        password: json["password"],
        numberPhone: json["numberPhone"],
        rol: json["rol"],
        envios: json["envios"],
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
        "curp": curp,
        "name": name,
        "lastName": lastName,
        "emailAddres": emailAddres,
        "password": password,
        "numberPhone": numberPhone,
        "rol": rol,
        "envios": envios,
      };
}
