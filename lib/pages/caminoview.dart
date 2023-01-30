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
            cempasuchilpay(),
            const Card(
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text('Luis Fernando Naal Pacheco'),
                    Text('+52 9992450318'),
                    Text('Calle 54 x 129 y 131 San Jose Tecoh, 97299, Mérida'),
                    Text('Yucatán, México'),
                    Text('Descripcion del lugar de entrega')
                  ],
                ),
              ),
            ),
            Card(
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Numero Pedido: 845466885648',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('Pago Efecutado: 01 Nov, 2022, 12:23',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    const Text('Método De Pago: ---------------',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    button,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ],
  ),
);

Card cempasuchilpay() {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(0),
      elevation: 50,
      child: Column(children: const <Widget>[
        //Contenido de la card
        ListTile(
          leading: Image(
            image: NetworkImage(
                'https://www.gastrolabweb.com/u/fotografias/m/2022/9/27/f1280x720-35392_167067_4938.jpg'),
          ),
          title: Text(
            'Cempasúchil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Montserrat',
            ),
          ),
          subtitle: Text(
            'Servicio: Exportación.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Text('01 nov 2022'),
        ),
        ListTile(
            title: (Text(
          'Subtotal: 42,000',
          style: TextStyle(
            fontSize: 13,
          ),
        ))),
        ListTile(
            title: (Text(
          'Total: 50,000',
          style: TextStyle(
            fontSize: 13,
          ),
        ))),
      ]));
}

Widget florCard = Container(
  child: Card(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Row(),
        )
      ],
    ),
  ),
);
