import 'package:flutter/material.dart';

class AlertShopBagWidget {
  static void showAlertDialog({required context, Widget? child}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Alert Dialog Title'),
          content: child,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Add functionality for the "OK" button
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
