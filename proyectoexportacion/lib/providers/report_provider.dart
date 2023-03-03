import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/request/report_create_request.dart';
import 'package:http/http.dart' as http;


class ReportProvider extends ChangeNotifier {
  final logger = Logger();

  Future createReport( int envioId, String typeReport, String description, String status, BuildContext context ) async {
    final report = ReportCreateRequestDto(
        envioId: envioId,
        typeReport: typeReport,
        description: description,
        status: status);
    final response = await http.post(
      Uri.parse('http://www.transhipper.somee.com/api/envios/reports'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(report),
    );

    if (response.statusCode == 201) {
      logger.d('Report Sent: ${response.body}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Report Sent')),
        );
        Navigator.pop(context);
      }
      } else {
      logger.e('Error: ${response.statusCode}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}!')),
        );
      }
    }
  }
}
