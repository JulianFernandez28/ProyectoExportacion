import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 46, 141, 25),
        title: const Text(
          'Reporte',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 196, 143, 231),
                ),
                child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(
                        Icons.report_outlined,
                        color: Colors.white,
                        size: 100,
                      ),
                    )),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                      'Si el cargamento tuvo algún inconveniente durante el traslado o llegó en mal estado seleccione alguna de las siguientes opciones.',
                      style: TextStyle(
                        fontSize: 16.5,
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('El envio no llegó')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('El envio llegó en mal estado')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Otro')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
