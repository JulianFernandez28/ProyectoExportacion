import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    required this.backfondo,
    required this.nameButton,
    required this.iconbutton,
    required this.colorIcon,
    Key? key,
  }) : super(key: key);

  final Color backfondo;
  final String nameButton;
  final IconData iconbutton;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 110,
        width: 330,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.black,
                backgroundColor: backfondo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: (() {}),
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
