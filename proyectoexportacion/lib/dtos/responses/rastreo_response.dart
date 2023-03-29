// To parse this JSON data, do
//
//     final rastreoResponseDto = rastreoResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RastreoResponseDto rastreoResponseDtoFromJson(String str) => RastreoResponseDto.fromJson(json.decode(str));

String rastreoResponseDtoToJson(RastreoResponseDto data) => json.encode(data.toJson());

class RastreoResponseDto {
    RastreoResponseDto({
        required this.createOn,
        required this.updateOn,
        required this.id,
        required this.envioId,
        required this.actualLocation,
        required this.lastLocation,
        required this.description,
        required this.dateTimeActual,
        required this.statusEnvio,
    });

    final DateTime createOn;
    final DateTime updateOn;
    final int id;
    final int envioId;
    late final String actualLocation;
    final String lastLocation;
    final String description;
    final DateTime dateTimeActual;
    final int statusEnvio;

    factory RastreoResponseDto.fromJson(Map<String, dynamic> json) => RastreoResponseDto(
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
        id: json["id"],
        envioId: json["envioId"],
        actualLocation: json["actualLocation"],
        lastLocation: json["lastLocation"],
        description: json["description"],
        dateTimeActual: DateTime.parse(json["dateTimeActual"]),
        statusEnvio: json["statusEnvio"],
    );

    Map<String, dynamic> toJson() => {
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
        "id": id,
        "envioId": envioId,
        "actualLocation": actualLocation,
        "lastLocation": lastLocation,
        "description": description,
        "dateTimeActual": dateTimeActual.toIso8601String(),
        "statusEnvio": statusEnvio,
    };
}
