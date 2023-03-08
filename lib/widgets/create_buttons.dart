import 'package:flutter/material.dart';
import 'package:transhipper/screens/ticket_screen.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    required this.backfondo,
    required this.nameButton,
    Key? key,
  }) : super(key: key);

  final Color backfondo;
  final String nameButton;

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
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Ticket()));
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  nameButton,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
