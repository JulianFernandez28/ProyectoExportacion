import 'package:flutter/material.dart';
import 'package:proyectoexportacion/pages/menuprincipal.dart';
import 'package:proyectoexportacion/pages/registro.dart';

import 'labelpassword.dart';
import 'labeltext.dart';

class FormularioLogin extends StatelessWidget {
  const FormularioLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Container(
      height: 310,
      width: 340,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
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
          LabelText(nameController: _emailController,tipodevalor: 'Email',iconsufflixIcon: Icons.email_outlined,),
          const Divider(
            height: 15.0,
          ),
          LabelPassword(passwordController: _passwordController, tipoValor: 'Password', iconsuffic: Icons.key,),
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
                      color: Color.fromARGB(255, 17, 63, 131)),
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
                      textStyle: const TextStyle(fontSize: 15)),
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistroUsuario()));
                  }),
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 196, 26, 26)),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            minWidth: 180,
            color: const Color.fromRGBO(87, 57, 124, 100),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MenuPrincipal()));
            },
            child: const Text(
              'Iniciar Sesion',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

