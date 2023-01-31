import 'package:flutter/material.dart';

Widget rastreo = Container(
    child: const Card(
  child: ListTile(
    trailing: Text('Teya, Yucatán'),
    subtitle: Text('Sotuta, Yucatán'),
  ),
));

Container cardflor() {
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
            ListTile(
              subtitle: Text('En camino'),
              trailing: Text('ServicioEntrega'),
            ),
          ],
        ),
      ],
    ),
  );
}
