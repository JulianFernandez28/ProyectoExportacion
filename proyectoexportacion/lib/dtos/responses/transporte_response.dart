import 'package:meta/meta.dart';
import 'dart:convert';

TransporteResponseDto transporteResponseDtoFromJson(String str) =>
    TransporteResponseDto.fromJson(json.decode(str));

String transporteResponseDtoToJson(TransporteResponseDto data) =>
    json.encode(data.toJson());

class TransporteResponseDto {
  TransporteResponseDto({
    required this.placa,
  });

  final String placa;

  factory TransporteResponseDto.fromJson(Map<String, dynamic> json) =>
      TransporteResponseDto(
        placa: json["placa"],
      );

  Map<String, dynamic> toJson() => {
        "placa": placa,
      };
}
