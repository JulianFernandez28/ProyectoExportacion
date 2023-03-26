import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyectoexportacion/dtos/request/user_update_request_dto.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/request/user_create_request.dart';
import 'package:proyectoexportacion/dtos/request/user_login_request.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../dtos/responses/userdata_response_dto.dart';

class UserProvider extends ChangeNotifier {
  final logger = Logger();

  UserResponseDto? _user;

  UserResponseDto? get user => _user;

  bool isloading = true;

  Future createUser(UserCreateRequestDto user, BuildContext context) async {
    final response =
        await http.post(Uri.parse('http://www.transhipper.somee.com/api/users'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(user));

    if (response.statusCode == 200) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User created successfully")));
        Navigator.of(context).pushReplacementNamed('/');
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("error registering data"),
        ));
      }
    }
  }

  Future loginUser(String email, String password, BuildContext context) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    final user = UserLoginRequestDto(email: email, password: password);

    final response = await http.post(
        Uri.parse('http://www.transhipper.somee.com/api/Account'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user));

    if (response.statusCode == 200) {
      if (context.mounted) {
        final json = jsonDecode(response.body);
        shared.setString('token', json['token']);
        shared.setString('curp', json['curp']);
        User.curp = json['curp'];

        loadData(json['token']);

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Bienvenido " + json["userName"])));
        Navigator.of(context).pushReplacementNamed('/Menu');
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Login incorrect"),
        ));
      }
    }
  }

  void loadData(String json) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(json);
    User.role = decodedToken[
        "http://schemas.microsoft.com/ws/2008/06/identity/claims/role"];
    logger.d(User.role);
  }

  Future getUser(String curp) async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");
    isloading = true;
    final respose = await http.get(
        Uri.parse("http://www.transhipper.somee.com/api/users/curp/$curp"),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        });
    logger.d(respose.statusCode);
    if (respose.statusCode == 200) {
      final json = jsonDecode(respose.body);
      logger.d(json);

      _user = UserResponseDto.fromJson(json);
      logger.d(_user);

      isloading = false;
      notifyListeners();
    } else {
      throw Exception("error loading");
    }
  }

  Future updateUser(String curp, UserUpdateRequestDto userUpdate,
      BuildContext context) async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");
    isloading = true;
    final respose = await http.put(
        Uri.parse("http://www.transhipper.somee.com/api/users/$curp"),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        },
        body: jsonEncode(userUpdate));
    if (respose.statusCode == 204) {
      if (context.mounted) {
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Update"),
        ));
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("error"),
        ));
      }
    }
  }
}
