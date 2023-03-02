import 'package:meta/meta.dart';
import 'dart:convert';

EnvioCreateRequestDto envioCreateRequestDtoFromJson(String str) => EnvioCreateRequestDto.fromJson(json.decode(str));

String envioCreateRequestDtoToJson(EnvioCreateRequestDto data) => json.encode(data.toJson());

class EnvioCreateRequestDto {
    EnvioCreateRequestDto({
        required this.title,
        required this.productId,
        required this.weightContent,
        required this.measures,
        required this.sourceLocation,
        required this.destinationLocation,
        required this.curpUserSubmit,
        required this.curpClient,
        required this.placaTransport,
    });

    final String title;
    final int productId;
    final String weightContent;
    final String measures;
    final String sourceLocation;
    final String destinationLocation;
    final String curpUserSubmit;
    final String curpClient;
    final String placaTransport;

    factory EnvioCreateRequestDto.fromJson(Map<String, dynamic> json) => EnvioCreateRequestDto(
        title: json["title"],
        productId: json["productId"],
        weightContent: json["weightContent"],
        measures: json["measures"],
        sourceLocation: json["sourceLocation"],
        destinationLocation: json["destinationLocation"],
        curpUserSubmit: json["curpUserSubmit"],
        curpClient: json["curpClient"],
        placaTransport: json["placaTransport"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "productId": productId,
        "weightContent": weightContent,
        "measures": measures,
        "sourceLocation": sourceLocation,
        "destinationLocation": destinationLocation,
        "curpUserSubmit": curpUserSubmit,
        "curpClient": curpClient,
        "placaTransport": placaTransport,
    };
}
