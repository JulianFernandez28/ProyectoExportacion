import 'package:flutter/material.dart';

class EmptyEnvios extends StatelessWidget {
  const EmptyEnvios({
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
                "Sin envios",
                style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
              ),
            ]),
          );
        }
      },
    );
  }
}
