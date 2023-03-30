import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/request/report_create_request.dart';
import 'package:proyectoexportacion/dtos/response/response_list_envios.dart';
import 'package:http/http.dart' as http;

class ReportProvider extends ChangeNotifier {
  bool isLoading = true;
  final logger = Logger();
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJDdXJwIjoiRkVDRjAzMDhIWU5STFJBOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJGcmVkZGkgSnVsaWFuICIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Ikp1bGlhbkBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiZWVjNGM1NmEtNzYwNS00NjUwLTg3NmQtYTQwYTVlNGEwMWNlIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmF0aW9uIjoiTWFyIFRodSAyMDIzIDE3OjEyOjM5IFBNIiwibmJmIjoxNjgwMTA5OTU5LCJleHAiOjE2ODAyMTQzNTksImlzcyI6IiAiLCJhdWQiOiIgIn0.VqBl05BS5xpPWiAyjZ9FV4dqw9pEi44ddU2kOavaHu0";

  List<ReportResponseDto>? _reports;

  List<ReportResponseDto>? get reports => _reports;

  Future createReport(
      int envioId,
      String typeReport,
      String description, //post
      String status,
      BuildContext context) async {
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

  Future getEnvioId(int envioID) async {
    final response = await http.get(
        Uri.parse(
            'http://www.transhipper.somee.com/api/envios/reports/envio/$envioID'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;

      _reports = data.map((e) => ReportResponseDto.fromJson(e)).toList();
      isLoading = false;

      notifyListeners();
    } else {
      throw Exception('Error');
    }
  }
}
