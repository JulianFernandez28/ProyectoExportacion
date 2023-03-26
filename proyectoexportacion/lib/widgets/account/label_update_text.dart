import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelUpdateText extends StatelessWidget {
  const LabelUpdateText({
    super.key,
    required this.data,
    required this.typeData,
    required this.nameController,
  });
  final TextEditingController nameController;
  final String data;
  final String typeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
            hintText: data,
            helperText: "Nuevo $typeData",
            suffixIcon: const Icon(Icons.edit)),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]"))
        ],
        validator: (value) {
          if (value == null || value.isEmpty || value.length > 25) {
            return "Ingrese un dato valido";
          }
          return null;
        },
        keyboardType: TextInputType.text,
      ),
    );
  }
}
