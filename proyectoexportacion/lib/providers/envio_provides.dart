import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/request/envio_create_request.dart';
import 'package:http/http.dart' as http;
import 'package:proyectoexportacion/dtos/request/status_request_dto.dart';
import 'package:proyectoexportacion/dtos/responses/envio_response_dto.dart';
import 'package:proyectoexportacion/dtos/responses/user_reponse_dto.dart';
import 'package:proyectoexportacion/providers/rastreo_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/envioalldetails.dart';

class EnvioProvider extends ChangeNotifier {
  final logger = Logger();
  bool isLoading = true;

  List<EnvioDto>? _envios;

  List<EnvioDto>? get envios => _envios;

  EnvioAllResponseDto? _envio;

  EnvioAllResponseDto? get envio => _envio;

  Future getEnvios() async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");
    final curp = local.getString("curp");

    final response = await http.get(
        Uri.parse(
            "http://www.transhipper.somee.com/api/Envios/user/$curp?PageNumber=1&PageSize=7"),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final List<dynamic> data = json;

      _envios = data.map((user) => EnvioDto.fromJson(user)).toList();

      isLoading = false;
      notifyListeners();
    } else {
      throw Exception("Error loading shipping");
    }
  }

  Future getShipping(int id) async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");
    isLoading = true;
    final response = await http.get(
        Uri.parse("http://www.transhipper.somee.com/api/Envios/data/$id"),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      _envio = EnvioAllResponseDto.fromJson(json);

      isLoading = false;
      notifyListeners();
    } else {
      throw Exception("error loading");
    }
  }

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
        Navigator.pushReplacement<void, void>(
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

  void createStatus(int id, EnvioCreateRequestDto envio) {
    RastreoProvider rastreo = RastreoProvider();
    var status = StatusRequestDto(
        envioId: id,
        actualLocation: envio.sourceLocation,
        lastLocation: "------",
        description: "Preparando el envio",
        dateTimeActual: DateTime.now(),
        statusEnvio: 0);

    rastreo.createStatus(status);
  }
}
