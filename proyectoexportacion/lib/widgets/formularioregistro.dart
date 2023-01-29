import 'package:flutter/material.dart';
import 'package:proyectoexportacion/pages/login.dart';

class FormularioRegistro extends StatelessWidget {
  const FormularioRegistro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nombreusuarioController = TextEditingController();
    final _apellidUsuarioController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Container(
      height: 380,
      width: 340,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 59, 59, 59),
                offset: Offset(5.0, 5.0),
                blurRadius: 10.0,
                spreadRadius: 0.8)
          ],
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          TextField(
            controller: _nombreusuarioController,
            enableInteractiveSelection: true,
            autofocus: true,
            autocorrect: false,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Nombres',
                labelText: 'Nombres',
                suffixIcon: const Icon(Icons.person_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          const Divider(
            height: 10.0,
          ),
          TextField(
            controller: _apellidUsuarioController,
            enableInteractiveSelection: true,
            autofocus: true,
            autocorrect: false,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Apellidos',
                labelText: 'Apellidos',
                suffixIcon: const Icon(Icons.person_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          const Divider(
            height: 10.0,
          ),
          TextField(
            controller: _emailController,
            enableInteractiveSelection: true,
            autofocus: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'E-mail',
                labelText: 'E-mail',
                suffixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          const Divider(
            height: 10.0,
          ),
          TextField(
            controller: _passwordController,
            enableInteractiveSelection: false,
            obscureText: true,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: const Icon(Icons.key),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minWidth: 200,
              color: const Color.fromRGBO(87, 57, 124, 100),
              onPressed: () {
                _nombreusuarioController.clear();
                _apellidUsuarioController.clear();
                _emailController.clear();
                _passwordController.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginTranshipper()));
              },
              child: const Text(
                'Registrarse',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
