import 'package:flutter/material.dart';


showLoaderDialog(context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          color: Colors.redAccent,
        ),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text(
              "Please wait...",
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.w600),
            )),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
