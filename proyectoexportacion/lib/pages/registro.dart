import 'package:flutter/material.dart';
import 'package:proyectoexportacion/widgets/circleimagelogo.dart';
import 'package:proyectoexportacion/widgets/fondodegrado.dart';

import '../widgets/formularioregistro.dart';

class RegistroUsuario extends StatelessWidget {
  const RegistroUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registrarse'),
        backgroundColor: const Color.fromRGBO(35, 46, 141, 25),
        leading: const BackButton(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const fondodegradado(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleImageLogo(),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Stack(
                    children:const  [
                      SingleChildScrollView(
                        child: FormularioRegistro(),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
