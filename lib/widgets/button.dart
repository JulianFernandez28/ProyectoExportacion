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
      onPressed: () {
        //reportes
        // Navigator.push(context, MaterialPageRoute(builder: (context) => reportes()));
      },
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
          onPressed: () {
            //rastreo
            //Navigator.push(context, MaterialPageRoute(builder: (context) => rastreo()));
          },
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
      onPressed: () {
        //ver
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ver()));
      },
      child: const Text('Ver'),
    ),
    const SizedBox(
      width: 40,
    )
  ],
);

Widget buttonrastreo =
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
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      onPressed: () {
        //actualizar(?)
        //Navigator.push(context, MaterialPageRoute(builder: (context) => actualizar()));
      },
      child: const Text(
        'Actualizar',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 15,
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
          onPressed: () {
            //Aceptar
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => aceptar()));
          },
          child: const Text(
            'Aceptar',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
            ),
          )))
]);
