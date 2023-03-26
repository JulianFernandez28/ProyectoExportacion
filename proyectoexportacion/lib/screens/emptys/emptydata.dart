import 'package:flutter/material.dart';

class EmtyPage extends StatelessWidget {
  const EmtyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Sin contenido",
                style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: const Color.fromARGB(255, 54, 33, 243)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Regresar"))
            ]),
          );
        }
      },
    );
  }
}
