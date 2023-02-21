import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/dtos/request/user_create_request.dart';
import 'package:proyectoexportacion/pages/login.dart';

import '../providers/user_provider.dart';
import 'labelpassword.dart';
import 'labeltext.dart';

class FormularioRegistro extends StatelessWidget {
  const FormularioRegistro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    final formKey = GlobalKey<FormState>();
    final _curpController = TextEditingController();
    final _nombreusuarioController = TextEditingController();
    final _apellidUsuarioController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
        child: ScrollNotificationObserver(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _curpController,
                  enableInteractiveSelection: false,
                  textCapitalization: TextCapitalization.characters,
                  autofocus: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 18) {
                      return 'Please enter a valid CURP';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "CURP",
                      labelText: "CURP",
                      suffixIcon: const Icon(Icons.assignment_ind),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                LabelText(
                  nameController: _nombreusuarioController,
                  tipodevalor: 'Nombre',
                  iconsufflixIcon: Icons.person_outlined,
                ),
                const SizedBox(
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
                TextFormField(
                  controller: _emailController,
                  enableInteractiveSelection: false,
                  autofocus: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid Email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Correo Electronico",
                      labelText: "Correo Electronico",
                      suffixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                const Divider(
                  height: 10.0,
                ),
                LabelPassword(
                  passwordController: _passwordController,
                  tipoValor: 'Contraseña',
                  iconsuffic: Icons.key,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(87, 57, 124, 100),
                          fixedSize:
                              const Size(double.maxFinite, double.infinity),
                          textStyle: const TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var user = UserCreateRequestDto(
                              curp: _curpController.text,
                              name: _nombreusuarioController.text,
                              lastName: _apellidUsuarioController.text,
                              emailAddres: _emailController.text,
                              password: _passwordController.text,
                              numberPhone: '',
                              rol: 'user');

                          logger.d(user.emailAddres);
                          context.read<UserProvider>().createUser(user,context);
                        }
                      },
                      child: const Text('Registrarse'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
