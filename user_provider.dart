import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:transhipper/dtos/responses/user_reponse_dto.dart';
import 'package:http/http.dart' as http;

String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJDdXJwIjoiTkFQTDAzMDEwOEhZTkxDU0E0IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6Ikx1aXMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJBdXJldW1AZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE1MzdhNWI3LWY2MjMtNGMxMS1hMDY0LTc5NGJlNWFhOGQ2OCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6Ik1hciBTYXQgMjAyMyAxNTo1MzoyNyBQTSIsIm5iZiI6MTY3ODQ2MzYwNywiZXhwIjoxNjc4NTcxNjA3LCJpc3MiOiIgIiwiYXVkIjoiICJ9.vl-nAakwy4sSmIHs_gUdrxpDwadld_hHw3vyIZTOKw8';

class UserProvider extends ChangeNotifier {
  final logger = Logger();

  List<EnviosDto>? _users;

  List<EnviosDto>? get users => _users;

  bool isLoading = true;

  Future getEnvios() async {
    final response = await http.get(
      Uri.parse(
          'http://www.transhipper.somee.com/api/Envios/user/601452943-8?PageNumber=1&PageSize=5'),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final envios = json.map((json) => EnviosDto.fromJson(json)).toList();
      final List<dynamic> data = json;

      logger.d(json);

      _users = data.map((user) => EnviosDto.fromJson(user)).toList();

      isLoading = false;
      notifyListeners();
    } else {
      throw Exception('estas bien pero bien envergado');
    }
  }
}
