import 'package:flutter/material.dart';

import '../../models/user.dart';

class AppBarUser extends StatelessWidget {
  const AppBarUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(231, 15, 28, 141),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            User.curp,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
