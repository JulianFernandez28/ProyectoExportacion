import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:proyectoexportacion/dtos/request/user_create_request.dart';
import 'package:proyectoexportacion/dtos/request/user_login_request.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  final logger = Logger();

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
        logger.d(shared.getString('curp'));

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
}
