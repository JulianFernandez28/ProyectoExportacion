import 'package:flutter/material.dart';

class LoginTranshipper extends StatelessWidget {
  const LoginTranshipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0.0, 0.1),
                    colors: <Color>[
                  Color.fromRGBO(35, 46, 141, 25),
                  Color.fromARGB(253, 163, 100, 60)
                ])),
          ),
          Positioned(
              bottom: 100,
              left: 20,
              right: 20,
              top: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 1,
                shadowColor: Colors.black,
                color: Colors.white,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        // FadeInImage.assetNetwork(
                        //   image:
                        //       'https://img.freepik.com/vector-premium/ilustracion-vector-barco-vela-dibujos-animados_491934-476.jpg?w=2000',
                        //   placeholder: '',
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const TextField(
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),
                    const TextField(
                      decoration: const InputDecoration(
                          filled: true, labelText: 'Password'),
                    )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
