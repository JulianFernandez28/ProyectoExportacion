import 'package:flutter/material.dart';

String description1 =
    " Noche Buena | Servicio: Exportación | Cantidad: 2 TL | Entrega en 2 días |";
String newDescription1 = description1.replaceAll("|", "\n");

Container cardNocheBuena() {
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
                        'https://www.elsoldepuebla.com.mx/doble-via/ecologia/es68bc-esta-flor-crece-en-zonas-de-clima-templado-y-calido/ALTERNATES/LANDSCAPE_1140/Esta%20flor%20crece%20en%20zonas%20de%20clima%20templado%20y%20c%C3%A1lido')),
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
