// To parse this JSON data, do
//
//     final statusRequestDto = statusRequestDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StatusRequestDto statusRequestDtoFromJson(String str) => StatusRequestDto.fromJson(json.decode(str));

String statusRequestDtoToJson(StatusRequestDto data) => json.encode(data.toJson());

class StatusRequestDto {
    StatusRequestDto({
        required this.envioId,
        required this.actualLocation,
        required this.lastLocation,
        required this.description,
        required this.dateTimeActual,
        required this.statusEnvio,
    });

    final int envioId;
    final String actualLocation;
    final String lastLocation;
    final String description;
    final DateTime dateTimeActual;
    final int statusEnvio;

    factory StatusRequestDto.fromJson(Map<String, dynamic> json) => StatusRequestDto(
        envioId: json["envioId"],
        actualLocation: json["actualLocation"],
        lastLocation: json["lastLocation"],
        description: json["description"],
        dateTimeActual: DateTime.parse(json["dateTimeActual"]),
        statusEnvio: json["statusEnvio"],
    );

    Map<String, dynamic> toJson() => {
        "envioId": envioId,
        "actualLocation": actualLocation,
        "lastLocation": lastLocation,
        "description": description,
        "dateTimeActual": dateTimeActual.toIso8601String(),
        "statusEnvio": statusEnvio,
    };
}
