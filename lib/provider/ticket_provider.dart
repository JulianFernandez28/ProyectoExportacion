import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:transhipper/dtos/responses/rastreo_response.dart';
import 'package:http/http.dart' as http;
import 'package:transhipper/dtos/responses/ticket_response.dart';

String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJDdXJwIjoiTkFQTDAzMDEwOEhZTkxDU0E0IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6Ikx1aXMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJBdXJldW1AZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjllN2RiOGZjLTU3MDUtNDE0MS04MDI2LWFlZTJhNzEyNjUyNiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6Ik1hciBXZWQgMjAyMyAyMjo1Njo1NCBQTSIsIm5iZiI6MTY3NzYyNTAxNCwiZXhwIjoxNjc3NzMzMDE0LCJpc3MiOiIgIiwiYXVkIjoiICJ9.7M-dUcG6kbZ99zG2PMUUJvsieeuF8H8STGEMIXkZmow';

class TicketProvider extends ChangeNotifier {
  final logger = Logger();

  List<TicketDto>? _users;

  List<TicketDto>? get users => _users;

  bool isLoading = true;

  Future getTicket() async {
    final response = await http.get(
      Uri.parse(
          'http://www.transhipper.somee.com/api/Envios/pagination?PageNumber=1&PageSize=1'),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final envios = json.map((json) => TicketDto.fromJson(json)).toList();
      final List<dynamic> data = json;

      _users = data.map((user) => TicketDto.fromJson(user)).toList();

      isLoading = false;
      notifyListeners();
    } else {
      throw Exception('estas bien pero bien envergado');
    }
  }
}
