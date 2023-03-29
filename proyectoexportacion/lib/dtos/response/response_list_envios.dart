// To parse this JSON data, do
//
//     final reportResponseDto = reportResponseDtoFromJson(jsonString);

import 'dart:convert';

ReportResponseDto reportResponseDtoFromJson(String str) =>
    ReportResponseDto.fromJson(json.decode(str));

String reportResponseDtoToJson(ReportResponseDto data) =>
    json.encode(data.toJson());

class ReportResponseDto {
  ReportResponseDto({
    required this.createOn,
    required this.updateOn,
    required this.id,
    required this.envioId,
    required this.typeReport,
    required this.description,
    required this.status,
  });

  DateTime createOn;
  DateTime updateOn;
  int id;
  int envioId;
  String typeReport;
  String description;
  String status;

  factory ReportResponseDto.fromJson(Map<String, dynamic> json) =>
      ReportResponseDto(
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
        id: json["id"],
        envioId: json["envioId"],
        typeReport: json["typeReport"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
        "id": id,
        "envioId": envioId,
        "typeReport": typeReport,
        "description": description,
        "status": status,
      };
}