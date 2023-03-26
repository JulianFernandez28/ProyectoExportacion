// To parse this JSON data, do
//
//     final ticketDto = ticketDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TicketDto ticketDtoFromJson(String str) => TicketDto.fromJson(json.decode(str));

String ticketDtoToJson(TicketDto data) => json.encode(data.toJson());

class TicketDto {
  TicketDto({
    required this.id,
    required this.title,
    required this.productId,
    required this.weightContent,
    required this.measures,
    required this.sourceLocation,
    required this.destinationLocation,
    required this.curpUserSubmit,
    required this.curpClient,
    required this.placaTransport,
    required this.user,
    required this.product,
    required this.reports,
    required this.status,
    required this.createOn,
    required this.updateOn,
  });

  final int id;
  final String title;
  final int productId;
  final String weightContent;
  final String measures;
  final String sourceLocation;
  final String destinationLocation;
  final String curpUserSubmit;
  final String curpClient;
  final String placaTransport;
  final dynamic user;
  final dynamic product;
  final dynamic reports;
  final dynamic status;
  final DateTime createOn;
  final DateTime updateOn;

  factory TicketDto.fromJson(Map<String, dynamic> json) => TicketDto(
        id: json["id"],
        title: json["title"],
        productId: json["productId"],
        weightContent: json["weightContent"],
        measures: json["measures"],
        sourceLocation: json["sourceLocation"],
        destinationLocation: json["destinationLocation"],
        curpUserSubmit: json["curpUserSubmit"],
        curpClient: json["curpClient"],
        placaTransport: json["placaTransport"],
        user: json["user"],
        product: json["product"],
        reports: json["reports"],
        status: json["status"],
        createOn: DateTime.parse(json["createOn"]),
        updateOn: DateTime.parse(json["updateOn"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "productId": productId,
        "weightContent": weightContent,
        "measures": measures,
        "sourceLocation": sourceLocation,
        "destinationLocation": destinationLocation,
        "curpUserSubmit": curpUserSubmit,
        "curpClient": curpClient,
        "placaTransport": placaTransport,
        "user": user,
        "product": product,
        "reports": reports,
        "status": status,
        "createOn": createOn.toIso8601String(),
        "updateOn": updateOn.toIso8601String(),
      };
}
