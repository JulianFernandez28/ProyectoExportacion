import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: const SizedBox(
        height: 50,
        width: 300,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: SizedBox(
        width: 375,
        child: Card(
          color: Colors.grey.shade400,
          child: Row(
            children: <Widget>[
              const Card(
                color: Colors.purple,
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Card(
                    child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2022/10/18/21/58/marigold-7531195_1280.jpg')),
                  ),
                ),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 60,
                    width: 250,
                    child: Text(
                      'Cempasuchil',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    'En Camino                Servicio De Entrega ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 55, 55, 55), fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
