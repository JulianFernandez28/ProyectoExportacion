import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/responses/transporte_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "package:http/http.dart" as http;

class TransporteProvider extends ChangeNotifier {
  final logger = Logger();

  List<TransporteResponseDto>? _transportes;

  List<TransporteResponseDto>? get transportes => _transportes;

  Future getTransporte() async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");

    final response = await http.get(
        Uri.parse('http://www.transhipper.somee.com/api/Transporte/list'),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;
      _transportes =
          data.map((e) => TransporteResponseDto.fromJson(e)).toList();
      logger.d(_transportes);
      notifyListeners();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
