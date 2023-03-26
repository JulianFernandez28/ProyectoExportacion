import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'package:proyectoexportacion/pages/registro.dart';
import 'package:proyectoexportacion/providers/user_provider.dart';

import 'labelpassword.dart';
import 'labeltext.dart';

class FormularioLogin extends StatelessWidget {
  const FormularioLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    final formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
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
            borderRadius: BorderRadius.circular(8.0)),
        child: ScrollNotificationObserver(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                LabelText(
                  nameController: _emailController,
                  tipodevalor: 'Email',
                  ejemploValor: "Transhipper@TRS.com",
                  iconsufflixIcon: Icons.email_outlined,
                ),
                const Divider(
                  height: 15.0,
                ),
                LabelPassword(
                  passwordController: _passwordController,
                  tipoValor: 'Password',
                  iconsuffic: Icons.key,
                ),
                
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        backgroundColor: const Color.fromRGBO(82, 38, 135, 1),
                        fixedSize:
                            const Size(double.maxFinite, double.infinity),
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        context.read<UserProvider>().loginUser(
                            _emailController.text,
                            _passwordController.text,
                            context);
                      }
                    },
                    child: const Text('Iniciar Sesion'),
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
                                  builder: (context) =>
                                      const RegistroUsuario()));
                        }),
                        child: const Text(
                          '¿Eres cliente? Registrate',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 196, 26, 26)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
