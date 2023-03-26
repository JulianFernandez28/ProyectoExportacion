import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../dtos/responses/ticket_response.dart';


class TicketProvider extends ChangeNotifier {
  final logger = Logger();

  List<TicketDto>? _ticket;

  List<TicketDto>? get ticket => _ticket;

  bool isLoading = true;

  Future getTicket() async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");
    final response = await http.get(
      Uri.parse(
          'http://www.transhipper.somee.com/api/Envios/pagination?PageNumber=1&PageSize=1'),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer $key",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final List<dynamic> data = json;

      _ticket = data.map((user) => TicketDto.fromJson(user)).toList();

      isLoading = false;
      notifyListeners();
    } else {
      throw Exception('error loading ticket');
    }
  }
}
