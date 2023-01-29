import 'package:flutter/material.dart';

class fondodegradado extends StatelessWidget {
  const fondodegradado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.0, 0.5),
              colors: <Color>[
            Color.fromRGBO(35, 46, 141, 25),
            Color.fromARGB(253, 163, 100, 60)
          ])),
    );
  }
}
