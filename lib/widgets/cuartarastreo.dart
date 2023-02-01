import 'package:flutter/material.dart';

Container rastreoItem4() {
  return Container(
    child: Row(
      children: <Widget>[
        Card(
          elevation: 20,
          child: Container(
              width: 70,
              height: 70,
              child: Card(
                color: const Color.fromARGB(255, 185, 185, 185),
                child: Column(
                  children: const [
                    Text(
                      'Enero',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '14',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ),
        Column(
          children: const [
            Text(
              'Llegó Al Destino  \n ',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '  Sotuta, Yucatán',
              style: TextStyle(
                  color: Color.fromARGB(255, 19, 38, 145),
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    ),
  );
}
