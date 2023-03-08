import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: const SizedBox(
        height: 50,
        width: 400,
        child: Center(
          child: Text(
            '     Teya,Yucatán                                      Sotuta,Yucatán   ',
            style: TextStyle(
              color: Color.fromARGB(255, 182, 61, 107),
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class FlowerTurn extends StatelessWidget {
  const FlowerTurn({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: Row(
        children: <Widget>[
          const Card(
            child: SizedBox(
              width: 90,
              height: 90,
              child: Card(
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.floresyplantas.net/wp-content/uploads/flores-de-lilium.jpg')),
              ),
            ),
          ),
          Column(
            children: const [
              SizedBox(
                height: 60,
                width: 250,
                child: Text(
                  'Lilium',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                'En Camino                Servicio De Entrega ',
                style: TextStyle(color: Colors.green, fontSize: 15),
              )
            ],
          ),
        ],
      ),
    );
  }
}
