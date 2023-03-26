import 'package:flutter/material.dart';
import 'package:proyectoexportacion/env/datos.dart';
import 'package:proyectoexportacion/pages/envioalldetails.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class SearchTracking extends StatelessWidget {
  const SearchTracking({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logOut() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      await Restart.restartApp();
    }

    final codigoController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscar envio"),
        backgroundColor: const Color.fromARGB(231, 15, 28, 141),
        centerTitle: true,
        
      ),
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Bienvenido",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 78, 22, 247)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Ingrese el codigo de rastreo",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: AutofillHints.birthday),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: codigoController,
                    autofocus: false,
                    enableInteractiveSelection: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 60, horizontal: 20),
                      labelText: "Codigo",
                      hintText: "# ",
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Por favor ingrese un código válido';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        backgroundColor: const Color.fromARGB(255, 70, 74, 182),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Datos.count = int.parse(codigoController.text);
                        codigoController.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EnvioAllDetails(
                                      idenvio: Datos.count,
                                    )));
                      }
                    },
                    child: const Text(
                      "Buscar",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
