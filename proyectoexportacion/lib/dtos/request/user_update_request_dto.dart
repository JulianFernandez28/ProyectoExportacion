// To parse this JSON data, do
//
//     final userUpdateRequestDto = userUpdateRequestDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserUpdateRequestDto userUpdateRequestDtoFromJson(String str) => UserUpdateRequestDto.fromJson(json.decode(str));

String userUpdateRequestDtoToJson(UserUpdateRequestDto data) => json.encode(data.toJson());

class UserUpdateRequestDto {
    UserUpdateRequestDto({
        required this.name,
        required this.lastName,
        required this.emailAddres,
        required this.password,
        required this.numberPhone,
        required this.rol,
    });

    final String name;
    final String lastName;
    final String emailAddres;
    final String password;
    final String numberPhone;
    final String rol;

    factory UserUpdateRequestDto.fromJson(Map<String, dynamic> json) => UserUpdateRequestDto(
        name: json["name"],
        lastName: json["lastName"],
        emailAddres: json["emailAddres"],
        password: json["password"],
        numberPhone: json["numberPhone"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastName": lastName,
        "emailAddres": emailAddres,
        "password": password,
        "numberPhone": numberPhone,
        "rol": rol,
    };
}
