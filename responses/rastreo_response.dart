// To parse this JSON data, do
//
//     final rastreoDto = rastreoDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RastreoDto rastreoDtoFromJson(String str) =>
    RastreoDto.fromJson(json.decode(str));

String rastreoDtoToJson(RastreoDto data) => json.encode(data.toJson());

class RastreoDto {
  RastreoDto({
    required this.id,
    required this.envioId,
    required this.actualLocation,
    required this.lastLocation,
    required this.description,
    required this.dateTimeActual,
    required this.statusEnvio,
    required this.createOn,
    required this.updateOn,
  });

  final int id;
  final int envioId;
  final String actualLocation;
  final String lastLocation;
  final String description;
  final DateTime dateTimeActual;
  final int statusEnvio;
  final DateTime createOn;
  final DateTime updateOn;

  factory RastreoDto.fromJson(Map<String, dynamic> json) => RastreoDto(
        id: json["id"],
        envioId: json["envioId"],
        actualLocation: json["actualLocation"],
        lastLocation: json["lastLocation"],
        description: json["description"],
        dateTimeActual: DateTime.parse(json["dateTimeActual"]),
        statusEnvio: json["statusEnvio"],
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "envioId": envioId,
        "actualLocation": actualLocation,
        "lastLocation": lastLocation,
        "description": description,
        "dateTimeActual": dateTimeActual.toIso8601String(),
        "statusEnvio": statusEnvio,
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
      };
}
