import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/request/envio_create_request.dart';
import 'package:http/http.dart' as http;
import 'package:proyectoexportacion/dtos/responses/productbyid_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/envioalldetails.dart';

class EnvioProvider extends ChangeNotifier {
  final logger = Logger();
  bool isLoading = true;

  Future<EnvioAllResponseDto> getEnviobyId(int id) async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");

    final response = await http.get(
        Uri.parse("http://www.transhipper.somee.com/api/Envios/data/$id"),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        });

    return envioAllResponseDtoFromJson(response.body);
  }

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
        var json = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Envio realizado con exito")));
        isLoading = false;
        final idEnvio = json["id"];
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => EnvioAllDetails(
                      idenvio: idEnvio,
                    )));
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${response.statusCode}")));
      }
    }
  }
}
