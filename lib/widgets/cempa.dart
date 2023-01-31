import 'package:flutter/material.dart';
import 'package:transhipper/widgets/button.dart';

// Card cempasuchil() {
//   return Card(
//     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     margin: const EdgeInsets.all(10),
//     elevation: 50,
//     child: Column(
//       children: <Widget>[
//         cardview(),
//         buttonsee,
//       ],
//     ),
//   );
// }

String description1 =
    " Cempasúchil | Servicio: Exportación | Cantidad: 2 TL | Entrega en 2 días |";
String newDescription1 = description1.replaceAll("|", "\n");

Container cardCempa() {
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
                  child: Text("Ver")),
            )
          ],
        ),
      ],
    ),
  );
}

//lilium image https://www.floresyplantas.net/wp-content/uploads/flores-de-lilium.jpg