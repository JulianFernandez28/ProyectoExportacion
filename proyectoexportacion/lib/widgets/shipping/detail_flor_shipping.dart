import 'package:flutter/material.dart';

import '../labeltext.dart';

class LabelTextFlor extends StatelessWidget {
  const LabelTextFlor({
    super.key,
    required this.pesoController,
    required this.medidasController,
  });

  final TextEditingController pesoController;
  final TextEditingController medidasController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: LabelText(
              nameController: pesoController,
              tipodevalor: "Peso",
              ejemploValor: '5kg',
              iconsufflixIcon: Icons.scale),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: LabelText(
              nameController: medidasController,
              tipodevalor: "Medidas",
              ejemploValor: "2x2",
              iconsufflixIcon: Icons.straighten),
        )
      ],
    );
  }
}
