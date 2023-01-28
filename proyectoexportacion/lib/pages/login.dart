import 'package:flutter/material.dart';

import '../widgets/circleimagelogo.dart';
import '../widgets/fondodegrado.dart';

class LoginTranshipper extends StatelessWidget {
  const LoginTranshipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Iniciar Sesion',
        ),
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
                padding: const EdgeInsets.only(top: 30),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: 310,
                        width: 340,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 25.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 59, 59, 59),
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 0.8,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            TextField(
                              enableInteractiveSelection: false,
                              autofocus: true,
                              textCapitalization: TextCapitalization.characters,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: 'UserName',
                                  labelText: 'UserName',
                                  suffixIcon: Icon(Icons.verified_user),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            const Divider(
                              height: 15.0,
                            ),
                            TextField(
                              enableInteractiveSelection: false,
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  suffixIcon: const Icon(Icons.key),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    'Restablecer Contraseña',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 17, 63, 131)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle:
                                            const TextStyle(fontSize: 15)),
                                    onPressed: (() {}),
                                    child: const Text(
                                      'Registrarse',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 196, 26, 26)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              minWidth: 180,
                              color: Color.fromRGBO(87, 57, 124, 100),
                              onPressed: () {},
                              child: Text(
                                'Iniciar Sesion',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
