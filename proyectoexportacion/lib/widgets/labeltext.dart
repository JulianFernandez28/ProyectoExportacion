import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required TextEditingController nameController,required this.tipodevalor, required this.iconsufflixIcon
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;
  final String tipodevalor;
  final IconData iconsufflixIcon;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      enableInteractiveSelection: false,
      autofocus: false,
      autocorrect: false,
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: tipodevalor,
          labelText: tipodevalor,
          suffixIcon: Icon(iconsufflixIcon),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
