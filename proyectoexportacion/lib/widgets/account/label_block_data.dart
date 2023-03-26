import 'package:flutter/material.dart';

class LabelBlockData extends StatelessWidget {
  const LabelBlockData({
    super.key,
    required this.data,
    required this.typeData,
  });

  final String data;
  final String typeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: true,
        initialValue: data,
        decoration: InputDecoration(
            labelText: typeData, suffixIcon: const Icon(Icons.block)),
      ),
    );
  }
}
