import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/providers/report_provider.dart';

class Report_buttons extends StatelessWidget {
  const Report_buttons({super.key, required this.reportType});
  final String reportType;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final logger = Logger();
    final descriptionController = TextEditingController();
    final int exampleID = 16;
    final defaultStatus = 'Pendiente';

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'El envió llego en mal estado',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Se solicita que agregue una breve descripcion del problema',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),

          Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Descripción'),
                      border: OutlineInputBorder(),
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
              )),
          // TextField(
          //     keyboardType: TextInputType.multiline,
          //     maxLines: null,
          //     decoration: const InputDecoration(
          //       hintText: 'Describa su problema',
          //       label: Text('Descripción'),
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: BorderSide(
          //           width: 2,
          //           color: Color.fromARGB(255, 159, 109, 190),
          //         ),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(
          //           width: 1,
          //           color: Color.fromARGB(255, 188, 155, 208),
          //         ),
          //       ),
          //     ),
          //   ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 0, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child:
                        const Text('Cancelar', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _dialog(context);
                      if (formKey.currentState!.validate()) {
                        context.read<ReportProvider>().createReport(
                            exampleID,
                            descriptionController.text,
                            reportType,
                            defaultStatus,
                            context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 70, 74, 182),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text('Enviar', style: TextStyle(fontSize: 16)),
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

void _dialog(BuildContext context) => showDialog(
    context: context,
    builder: (_) => const AlertDialog(
          title: Text('Reporte Enviado'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                size: 150,
                weight: 20,
              ),
              Text('Su reporte se ha enviado correctamente')
            ],
          ),
          elevation: 5.0,
        ));
