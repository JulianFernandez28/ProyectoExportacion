import 'package:flutter/material.dart';
import 'package:proyectoexportacion/widgets/fourscreen.dart';
import 'package:proyectoexportacion/widgets/perfilscreen.dart';
import 'package:proyectoexportacion/widgets/secondscreen.dart';
import 'package:proyectoexportacion/widgets/thirtscreen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
      ),
      body: SizedBox(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()));
              },
              child: const Text('Nuevo envio'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThirtScreen()));
              },
              child: const Text('Envios'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const FourScreen())));
              },
              child: const Text('Rastreo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PerfilUser()));
              },
              child: const Text('Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
