import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../card_title.dart';
import '../labeltext.dart';

class CardDetailsUser extends StatelessWidget {
  const CardDetailsUser({
    super.key,
    required this.curpUserController,
    required this.cpController,
    required this.estadoController,
    required this.municipioController,
    required this.calleController,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController curpUserController;
  final TextEditingController cpController;
  final TextEditingController estadoController;
  final TextEditingController municipioController;
  final TextEditingController calleController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const TitleCards(
                    title: "Detalles del cliente", icons: Icons.person_pin),
                LabelText(
                    nameController: curpUserController,
                    tipodevalor: "Curp del cliente",
                    iconsufflixIcon: Icons.co_present_rounded,
                    ejemploValor: ""),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: cpController,
                  enableInteractiveSelection: false,
                  autofocus: false,
                  autocorrect: false,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Código postal',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu código postal';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: LabelText(
                          nameController: estadoController,
                          tipodevalor: "Estado",
                          iconsufflixIcon: Icons.shield,
                          ejemploValor: ""),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: LabelText(
                          nameController: municipioController,
                          tipodevalor: "Municipio",
                          iconsufflixIcon: Icons.shield_outlined,
                          ejemploValor: ""),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                LabelText(
                    nameController: calleController,
                    tipodevalor: "Calle",
                    iconsufflixIcon: Icons.streetview_outlined,
                    ejemploValor: "01 x 01 y 01")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

