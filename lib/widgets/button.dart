import 'package:flutter/material.dart';

Widget button =
    Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
  TextButton(
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
    onPressed: () {},
    child: const Text(
      'Reportar',
      style: TextStyle(
        fontFamily: 'Montserrat',
      ),
    ),
  ),
  TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () {},
      child: const Text(
        'Rastreo',
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ))
]);
