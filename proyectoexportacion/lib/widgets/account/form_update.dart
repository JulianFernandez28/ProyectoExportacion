import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/dtos/responses/userdata_response_dto.dart';
import 'package:proyectoexportacion/providers/user_provider.dart';

import '../../dtos/request/user_update_request_dto.dart';
import 'label_block_data.dart';
import 'label_update_text.dart';

MaterialPageRoute<dynamic> FormUpdate(
  GlobalKey<FormState> formKey,
  UserResponseDto userd,
  TextEditingController nameController,
  TextEditingController lastNameController,
  TextEditingController numberController,
) {
  return MaterialPageRoute(
    fullscreenDialog: true,
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(231, 15, 28, 141),
          title: const Text('Editar perfil'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        LabelBlockData(
                          data: userd.curp,
                          typeData: "CURP",
                        ),
                        LabelUpdateText(
                          data: userd.name,
                          typeData: "Nombre",
                          nameController: nameController,
                        ),
                        LabelUpdateText(
                          data: userd.lastName,
                          typeData: "Apellido",
                          nameController: lastNameController,
                        ),
                        LabelBlockData(
                          data: userd.emailAddres,
                          typeData: "Correo electronico",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: numberController,
                            decoration: InputDecoration(
                                hintText: userd.numberPhone,
                                helperText: "Nuevo numero",
                                suffixIcon: const Icon(Icons.numbers)),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.phone,
                          ),
                        )
                      ],
                    )),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(30, 40),
                          backgroundColor: const Color.fromARGB(255, 243, 33, 33),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(40, 40),
                          backgroundColor:
                              const Color.fromARGB(255, 65, 33, 243),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var user = UserUpdateRequestDto(
                              name: nameController.text,
                              lastName: lastNameController.text,
                              emailAddres: userd.emailAddres,
                              password: userd.password,
                              numberPhone: numberController.text,
                              rol: userd.rol);
                        
                          context
                              .read<UserProvider>()
                              .updateUser(userd.curp, user, context);

                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Actualizar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
