import 'package:flutter/material.dart';

class CircleImageLogo extends StatelessWidget {
  const CircleImageLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 100.0,
      backgroundImage: AssetImage("images/logo.png"),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
