// To parse this JSON data, do
//
//     final reportCreateRequestDto = reportCreateRequestDtoFromJson(jsonString);

import 'dart:convert';

ReportCreateRequestDto reportCreateRequestDtoFromJson(String str) => ReportCreateRequestDto.fromJson(json.decode(str));

String reportCreateRequestDtoToJson(ReportCreateRequestDto data) => json.encode(data.toJson());

class ReportCreateRequestDto {
    ReportCreateRequestDto({
        required this.envioId,
        required this.typeReport,
        required this.description,
        required this.status,
    });

    int envioId;
    String typeReport;
    String description;
    String status;

    factory ReportCreateRequestDto.fromJson(Map<String, dynamic> json) => ReportCreateRequestDto(
        envioId: json["envioId"],
        typeReport: json["typeReport"],
        description: json["description"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "envioId": envioId,
        "typeReport": typeReport,
        "description": description,
        "status": status,
    };
}