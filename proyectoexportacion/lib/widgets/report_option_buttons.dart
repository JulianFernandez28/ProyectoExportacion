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
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReportDescription(type: type)));
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(310, double.infinity),
            textStyle: TextStyle(fontSize: 18),
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            shadowColor: Colors.black,
            foregroundColor: Colors.white,
            elevation: 3,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(type, textAlign: TextAlign.center,),
          )),
    );
  }
}
