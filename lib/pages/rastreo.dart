import 'package:flutter/material.dart';

import 'package:transhipper/widgets/rastreo_data.dart';

class Rastreo extends StatefulWidget {
  const Rastreo({super.key});

  @override
  State<Rastreo> createState() => _Rastreo();
}

class _Rastreo extends State<Rastreo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Rastreo',
        ),
        backgroundColor: const Color.fromRGBO(35, 46, 141, 25),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                RastreoScreen(),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
