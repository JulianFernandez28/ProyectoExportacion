import 'package:flutter/material.dart';

class TitleCards extends StatelessWidget {
  const TitleCards({
    super.key,
    required this.title,
    required this.icons,
  });

  final String title;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ListTile(
                leading: Icon(icons),
                title: Text("$title"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
