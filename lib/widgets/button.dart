import 'package:flutter/material.dart';

Widget button =
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
  Expanded(
    flex: 0,
    child: TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
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
  ),
  Expanded(
      flex: 0,
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {},
          child: const Text(
            'Rastreo',
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
          )))
]);

Widget buttonsee = Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 180, 84, 132)),
      ),
      onPressed: () {},
      child: const Text('Ver'),
    ),
    const SizedBox(
      width: 40,
    )
  ],
);
