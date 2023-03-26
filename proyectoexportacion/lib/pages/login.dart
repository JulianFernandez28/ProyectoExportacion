import 'package:flutter/material.dart';

import '../widgets/circleimagelogo.dart';
import '../widgets/fondodegrado.dart';
import '../widgets/formulariologin.dart';

class LoginTranshipper extends StatefulWidget {
  const LoginTranshipper({super.key});

  @override
  State<LoginTranshipper> createState() => _LoginTranshipperState();
}

class _LoginTranshipperState extends State<LoginTranshipper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Iniciar Sesion',
        ),
        backgroundColor: const Color.fromARGB(231, 15, 28, 141),
      ),
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const fondodegradado(),
          ListView(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleImageLogo(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Stack(
                        children: const [
                          SingleChildScrollView(
                            child: FormularioLogin(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ])
        ],
      )),
    );
  }
}
