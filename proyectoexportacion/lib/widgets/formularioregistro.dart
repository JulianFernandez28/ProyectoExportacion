import 'package:flutter/material.dart';
import 'package:proyectoexportacion/pages/login.dart';

import 'labelpassword.dart';
import 'labeltext.dart';

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
          LabelText(
            nameController: _nombreusuarioController,
            tipodevalor: 'Nombre',
            iconsufflixIcon: Icons.person_outlined,
          ),
          const Divider(
            height: 10.0,
          ),
          LabelText(
            nameController: _apellidUsuarioController,
            tipodevalor: 'Apellidos',
            iconsufflixIcon: Icons.person_outlined,
          ),
          const Divider(
            height: 10.0,
          ),
          LabelText(
            nameController: _emailController,
            tipodevalor: 'Email',
            iconsufflixIcon: Icons.email_outlined,
          ),
          const Divider(
            height: 10.0,
          ),
          LabelPassword(passwordController: _passwordController, tipoValor: 'Password', iconsuffic: Icons.key,),
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

