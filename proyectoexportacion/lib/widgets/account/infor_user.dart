import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({
    super.key,
    required this.tipo,
    required this.dato,
  });

  final String tipo;

  final String dato;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(
        depth: 5, // Profundidad de la sombra
        color: Colors.white, // Color de fondo
        intensity: 0.8, // Intensidad de la sombra
        shape: NeumorphicShape.flat, // Forma del widget
        lightSource: LightSource.topLeft, // Fuente de luz
      ),
      child: TextFormField(
        readOnly: true, // Hacer que el campo sea de solo lectura
        initialValue: dato,
        textAlignVertical: TextAlignVertical
            .bottom, // Alinear el texto del label al fondo del espacio del label
        decoration: InputDecoration(
          labelText: tipo,
          floatingLabelBehavior:
              FloatingLabelBehavior.always, // Mostrar el label encima del campo
          contentPadding: const EdgeInsets.fromLTRB(
              16.0, 15.0, 16.0, 16.0), // Añadir un padding interno al widget
        ),
      ),
    );
  }
}
