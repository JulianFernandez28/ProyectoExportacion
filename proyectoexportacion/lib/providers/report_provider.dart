import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/request/report_create_request.dart';
import 'package:http/http.dart' as http;

class ReportProvider extends ChangeNotifier {
  final logger = Logger();
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJDdXJwIjoiRkVDRjAzMDhIWU5STFJBOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJGcmVkZGkgSnVsaWFuIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiSnVsaWFuQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJlYWU1MDI4Mi00MzE3LTQ5YjItYjRlNi0xMzIwNjEyYjhhMTIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2V4cGlyYXRpb24iOiJNYXIgVHVlIDIwMjMgMTk6NDg6MTYgUE0iLCJuYmYiOjE2Nzg3MzY4OTYsImV4cCI6MTY3ODg0MTI5NiwiaXNzIjoiICIsImF1ZCI6IiAifQ.CMXD1hJIN_h_IiGUr6HXRI2QJUO7d0u3nuaxqajgkxw";

  Future createReport(int envioId, String typeReport, String description,
      String status, BuildContext context) async {
    final report = ReportCreateRequestDto(
        envioId: envioId,
        typeReport: typeReport,
        description: description,
        status: status);
    final response = await http.post(
      Uri.parse('http://www.transhipper.somee.com/api/envios/reports'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
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
