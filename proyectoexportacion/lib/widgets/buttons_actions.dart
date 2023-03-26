import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proyectoexportacion/pages/menuprincipal.dart';

class ButtonsActions extends StatelessWidget {
  ButtonsActions({super.key, this.route = ""});

  String? route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(130, 40),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 52, 11, 156),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                // formkey.currentState!.reset();
                Navigator.of(context).popUntil(ModalRoute.withName('/Menu'));
              },
              child: const Text("Salir")),
        ),
      ],
    );
  }
}
