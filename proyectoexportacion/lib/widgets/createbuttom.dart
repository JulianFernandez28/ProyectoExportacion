import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


class CreateButton extends StatelessWidget {
  const CreateButton(
      {required this.backfondo,
      required this.nameButton,
      required this.iconbutton,
      required this.colorIcon,
      Key? key,
      this.route = "#"})
      : super(
          key: key,
        );

  final Color backfondo;
  final String nameButton;
  final IconData iconbutton;
  final Color colorIcon;
  final String route;

  @override
  Widget build(BuildContext context) {
    final logger = new Logger();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: SizedBox(
        height: 110,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.black,
                backgroundColor: backfondo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: (() async {
              Navigator.pushNamed(context, route);
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  nameButton,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Icon(iconbutton, size: 90, color: colorIcon)
              ],
            )),
      ),
    );
  }
}
