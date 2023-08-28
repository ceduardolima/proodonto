import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context, String dialogText) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
            Container(
              width: 10,
            ),
            const Text("Atenção!"),
            Container(
              width: 10,
            ),
          ],
        )),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Container(
                height: 20,
              ),
              Center(
                child: Text(
                  dialogText,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
