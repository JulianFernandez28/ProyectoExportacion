import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/dtos/request/report_create_request.dart';
import 'package:proyectoexportacion/providers/report_provider.dart';

import '../env/datos.dart';

class Report_body extends StatelessWidget {
  const Report_body({super.key, required this.reportType});
  final String reportType;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final logger = Logger();
    final descriptionController = TextEditingController();
    int exampleID = Datos.count;
    const defaultStatus = 'Pendiente';

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            reportType.toUpperCase(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Se solicita que agregue una breve descripcion del problema',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          Form(
              key: formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 5,
                      decoration: const InputDecoration(
                        label: Text('Descripción'),
                        labelStyle: TextStyle(
                            fontSize: 25, color: Color.fromRGBO(66, 66, 66, 1)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 94, 94, 94),
                        )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 159, 109, 190),
                          ),
                        ),
                      ),
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 0, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      fixedSize: const Size.fromHeight(50),
                    ),
                    child:
                        const Text('Cancelar', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final r = ReportCreateRequestDto(
                            envioId: exampleID,
                            typeReport: reportType,
                            description: descriptionController.text,
                            status: defaultStatus);
                        
                        context.read<ReportProvider>().createReport(
                            r,
                            context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 70, 74, 182),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        fixedSize: const Size.fromHeight(50)),
                    child: const Text('Enviar', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


// void _dialog(BuildContext context) => showDialog(
//     context: context,
//     builder: (_) => const AlertDialog(
//           title: Text('Reporte Enviado'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(
//                 Icons.check_circle_outline_rounded,
//                 size: 150,
//                 weight: 20,
//               ),
//               Text('Su reporte se ha enviado correctamente')
//             ],
//           ),
//           elevation: 5.0,
//         ));
