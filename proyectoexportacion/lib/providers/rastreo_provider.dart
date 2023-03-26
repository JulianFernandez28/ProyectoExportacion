import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;
import 'package:proyectoexportacion/dtos/request/status_request_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dtos/responses/rastreo_response.dart';

class RastreoProvider extends ChangeNotifier {
  final logger = Logger();

  List<RastreoResponseDto>? _rastreo;

  List<RastreoResponseDto>? get rastreo => _rastreo;
  bool isLoading = true;

  Future getRastreo(int id) async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");
    _rastreo = [];

    final response = await http.get(
      Uri.parse('http://www.transhipper.somee.com/api/Envio/Status/list/$id'),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer $key",
      },
    );
    isLoading = true;

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final List<dynamic> data = json;

      _rastreo =
          data.map((rastreo) => RastreoResponseDto.fromJson(rastreo)).toList();

      isLoading = false;
      logger.d(data);
      notifyListeners();
    } else {
      throw Exception('error loading Rastreo');
    }
  }

  Future createStatus(StatusRequestDto status) async {
    final response = await http.post(
        Uri.parse('http://www.transhipper.somee.com/api/Envio/Status'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(status));
    logger.d(response.body);
  }
}
