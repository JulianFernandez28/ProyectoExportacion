import 'package:flutter/material.dart';
import 'package:proyectoexportacion/pages/report_description.dart';

class Reports extends StatelessWidget {
  const Reports({super.key});
  

  @override
  Widget build(BuildContext context) {
    String type;
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
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 196, 143, 231),
                ),
                child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(
                        Icons.report_outlined,
                        color: Colors.white,
                        size: 120,
                      ),
                    )),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'Si el cargamento tuvo algún inconveniente durante el traslado o llegó en mal estado seleccione alguna de las siguientes opciones.',
                      style: TextStyle(
                        fontSize: 16.5,
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          type = 'El envio no llegó';
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReportDescription(type: type)));
                        },
                        child: const Text('El envio no llegó')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          type = 'El envio llegó en mal estado';
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReportDescription(type: type)));
                        },
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
