import 'package:flutter/material.dart';

class CircleImageLogo extends StatelessWidget {
  const CircleImageLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.white,
        child: Image.asset(
          'images/logo.png',
        ));
  }
}
