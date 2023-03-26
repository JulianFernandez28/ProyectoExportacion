import 'package:flutter/material.dart';

import '../../env/datos.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: Color.fromARGB(255, 228, 228, 228),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Ubicacion: ${Datos.destinoLocation}")],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
