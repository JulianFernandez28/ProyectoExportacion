import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/request/report_create_request.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReportProvider extends ChangeNotifier {
  final logger = Logger();
  

  Future createReport(ReportCreateRequestDto report, BuildContext context) async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");
    final response = await http.post(
      Uri.parse('http://www.transhipper.somee.com/api/envios/reports'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $key'
      },
      body: jsonEncode(report),
    );

    if (response.statusCode == 200) {
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
