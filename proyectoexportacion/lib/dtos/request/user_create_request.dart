// To parse this JSON data, do
//
//     final userCreateRequestDto = userCreateRequestDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserCreateRequestDto userCreateRequestDtoFromJson(String str) => UserCreateRequestDto.fromJson(json.decode(str));

String userCreateRequestDtoToJson(UserCreateRequestDto data) => json.encode(data.toJson());

class UserCreateRequestDto {
    UserCreateRequestDto({
        required this.curp,
        required this.name,
        required this.lastName,
        required this.emailAddres,
        required this.password,
        required this.numberPhone,
        required this.rol,
    });

    final String curp;
    final String name;
    final String lastName;
    final String emailAddres;
    final String password;
    final String numberPhone;
    final String rol;

    factory UserCreateRequestDto.fromJson(Map<String, dynamic> json) => UserCreateRequestDto(
        curp: json["curp"],
        name: json["name"],
        lastName: json["lastName"],
        emailAddres: json["emailAddres"],
        password: json["password"],
        numberPhone: json["numberPhone"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "curp": curp,
        "name": name,
        "lastName": lastName,
        "emailAddres": emailAddres,
        "password": password,
        "numberPhone": numberPhone,
        "rol": rol,
    };
}
