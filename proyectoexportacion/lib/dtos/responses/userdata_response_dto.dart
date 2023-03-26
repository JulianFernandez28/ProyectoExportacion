// To parse this JSON data, do
//
//     final userResponseDto = userResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserResponseDto userResponseDtoFromJson(String str) =>
    UserResponseDto.fromJson(json.decode(str));

String userResponseDtoToJson(UserResponseDto data) =>
    json.encode(data.toJson());

class UserResponseDto {
  UserResponseDto({
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

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      UserResponseDto(
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
