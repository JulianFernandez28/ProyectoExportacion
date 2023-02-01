import 'package:flutter/material.dart';
import 'package:transhipper/widgets/button.dart';
import 'package:transhipper/widgets/secondrastreocard.dart';
import 'package:transhipper/widgets/cardrastreo.dart';
import 'package:transhipper/widgets/cuartarastreo.dart';
import 'package:transhipper/widgets/tercerastreo.dart';

Widget rastreo = Container(
  child: Card(
      child: Column(
    children: <Widget>[
      datacont1(),
      const Text(
          '\n \n Teya, Yucatán                              Sotuta, Yucatán \n \n',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.bold)),
      rastreoItem(),
      rastreoItem2(),
      rastreoItem3(),
      rastreoItem4(),
      buttonrastreo,
    ],
  )),
);

String description = "Cempasúchil ";

String newDescription = description.replaceAll("|", "\n");

Container datacont1() {
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
        Column(
          children: [
            Text(
              newDescription,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "\n \n En camino            Entrega",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 139, 42)),
            ),
          ],
        ),
      ],
    ),
  );
}
