import 'package:flutter/material.dart';
import 'package:proyectoexportacion/widgets/Report_body.dart';
class ReportDescription extends StatelessWidget {
  const ReportDescription({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 46, 141, 25),
        title: const Text(
          'Descripción',
          textAlign: TextAlign.center,
        ),
      ),
      body: Report_body(reportType: type,),
    );
  }
}