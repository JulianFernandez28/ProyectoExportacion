import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/responses/producto_response_dto.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider extends ChangeNotifier {
  final logger = Logger();

  List<ProductResponseDto>? _products;

  List<ProductResponseDto>? get producs => _products;

  Future getProducts() async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");

    final response = await http.get(
        Uri.parse('http://www.transhipper.somee.com/api/Products/list'),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        });

    logger.d(response.body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;
      _products = data.map((e) => ProductResponseDto.fromJson(e)).toList();
      logger.d(_products);
      notifyListeners();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
