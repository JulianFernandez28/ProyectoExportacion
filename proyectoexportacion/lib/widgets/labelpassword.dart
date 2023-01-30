import 'package:flutter/material.dart';

class LabelPassword extends StatelessWidget {
  const LabelPassword({
    Key? key,
    required TextEditingController passwordController, required this.tipoValor, required this.iconsuffic,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;
  final String tipoValor;
  final IconData iconsuffic;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _passwordController,
      enableInteractiveSelection: false,
      obscureText: true,
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: tipoValor,
          labelText: tipoValor,
          suffixIcon: Icon(iconsuffic),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
