import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyectoexportacion/dtos/request/envio_create_request.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EnvioProvider extends ChangeNotifier {
  Future createEnvio(EnvioCreateRequestDto envio, BuildContext context) async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");

    final response = await http.post(
        Uri.parse("http://www.transhipper.somee.com/api/Envios"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $key"
        },
        body: jsonEncode(envio));

    if (response.statusCode == 200) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Envio realizado con exiyo")));
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${response.statusCode}")));
      }
    }
  }
}
