import 'package:flutter/material.dart';

class ButtonsActions extends StatelessWidget {
  ButtonsActions({super.key, this.route = ""});

  String? route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    backgroundColor: const Color.fromARGB(255, 52, 11, 156),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  // formkey.currentState!.reset();
                  Navigator.of(context).pushReplacementNamed("$route");
                },
                child: const Text("Continuar")),
          ),
        ],
      ),
    );
  }
}
