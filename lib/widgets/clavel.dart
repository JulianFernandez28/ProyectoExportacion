import 'package:flutter/material.dart';

String description1 =
    " Clavel | Servicio: Exportación | Cantidad: 2 TL | Entrega en 2 días |";
String newDescription1 = description1.replaceAll("|", "\n");

Container cardClavel() {
  return Container(
    child: Row(
      children: <Widget>[
        Card(
          elevation: 20,
          child: Container(
              width: 150,
              height: 150,
              child: const Card(
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.consumer.es/app/uploads/fly-images/14205/img_clavel-1200x550-cc.jpg')),
              )),
        ),
        Row(
          children: [
            Text(
              newDescription1,
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 125,
              ),
              child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 180, 84, 132)),
                  ),
                  child: const Text("Ver")),
            )
          ],
        ),
      ],
    ),
  );
}
