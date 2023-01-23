

import 'package:flutter/material.dart';

class ThirtScreen extends StatelessWidget {
  const ThirtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles usuario'),
      ),
      body: SizedBox(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Detalles envio'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
