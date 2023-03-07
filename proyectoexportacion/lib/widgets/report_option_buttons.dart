import 'package:flutter/material.dart';
import 'package:proyectoexportacion/pages/report_description.dart';

class ReportOptionButtons extends StatelessWidget {
  const ReportOptionButtons({
    required this.type,
    required this.color,
    super.key,
  });

  final String type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReportDescription(type: type)));
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(350, 80),
            textStyle: TextStyle(fontSize: 20),
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            shadowColor: Colors.black,
            elevation: 5,
          ),
          child: Text(type)),
    );
  }
}
