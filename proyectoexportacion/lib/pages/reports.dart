import 'package:flutter/material.dart';
import '../widgets/report_option_buttons.dart';

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
        child: SingleChildScrollView(
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
                    color: Color(0xFF3949AB),
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
                 Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        'Si el cargamento tuvo algún inconveniente durante el traslado o llegó en mal estado seleccione alguna de las siguientes opciones.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ReportOptionButtons(type: 'El envío no llegó', color: Colors.indigo.shade700),
                    ReportOptionButtons(type: 'El envío llegó en mal estado', color: Colors.indigo.shade700),
                    ReportOptionButtons(type: 'Otro', color: Colors.indigo.shade300),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

