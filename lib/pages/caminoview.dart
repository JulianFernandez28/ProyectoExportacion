import 'package:flutter/material.dart';
import 'package:transhipper/widgets/button.dart';

Widget infoGeneral = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Información General',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Montserrat'),
              ),
            ),
            datacont(),
            const Card(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                'Información del usuario',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Luis Fernando Naal Pacheco',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '+52 9992450318',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Calle 54  San Jose Tecoh, 97299, Mérida',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Yucatán, México',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Descripcion del lugar de entrega',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Center(
                child: Column(
                  children: const <Widget>[
                    Text(
                      'Numero Pedido: 845466885648',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Pago Efecutado: 01 Nov, 2022, 12:23',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Método De Pago: ---------------',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
            button
          ],
        ),
      ),
    ],
  ),
);

String description =
    " Cempasúchil | Servicio: Exportación | Cantidad: 2 TL | Entrega en 2 días |"
    " | Subtotal: 45,000 |"
    " Total: 50,000";
String newDescription = description.replaceAll("|", "\n");

Container datacont() {
  return Container(
    child: Row(
      children: <Widget>[
        Card(
          child: Container(
              width: 150,
              height: 150,
              child: const Card(
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.gastrolabweb.com/u/fotografias/m/2022/9/27/f1280x720-35392_167067_4938.jpg')),
              )),
        ),
        Row(
          children: [
            Text(
              newDescription,
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            //datapago()
          ],
        ),
      ],
    ),
  );
}
