import 'package:flutter/material.dart';
import 'package:transhipper/widgets/create_buttons.dart';
import 'package:transhipper/widgets/rastreo_screen.dart';

class RastreoScreen extends StatelessWidget {
  const RastreoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FlowerTurn(),
        const Details(),
        Card(
          color: Colors.grey.shade200,
          child: Row(
            children: <Widget>[
              Card(
                child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      color: Colors.grey.shade200,
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
                            '08',
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
                    'Recoleccion   \n ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '  Teya, Yucatán',
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
        ),
        //Inicia
        Card(
          color: Colors.grey.shade200,
          child: Row(
            children: <Widget>[
              Card(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Card(
                    color: Colors.grey.shade200,
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
                  ),
                ),
              ),
              Column(
                children: const [
                  Text(
                    'Llegó A Mérida   \n ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '  Mérida, Yucatán',
                    style: TextStyle(
                        color: Color.fromARGB(255, 19, 38, 145),
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ), //termina
        Card(
          color: Colors.grey.shade200,
          child: Row(
            children: <Widget>[
              Card(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Card(
                    color: Colors.grey.shade200,
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
                          '20',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: const [
                  Text(
                    'Salió De Mérida   \n ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '  Mérida, Yucatán',
                    style: TextStyle(
                        color: Color.fromARGB(255, 19, 38, 145),
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
        Card(
          color: Colors.grey.shade200,
          child: Row(
            children: <Widget>[
              Card(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Card(
                    color: Colors.grey.shade200,
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
                          '30',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: const [
                  Text(
                    'Llegó Al Destino   \n ',
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
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SizedBox(
              height: 90,
              width: 130,
              child: CreateButton(
                  backfondo: Colors.green, nameButton: 'Actualizar'),
            ),
            SizedBox(
              height: 90,
              width: 105,
              child:
                  CreateButton(backfondo: Colors.purple, nameButton: 'Aceptar'),
            )
          ],
        )
      ],
    );
  }
}
