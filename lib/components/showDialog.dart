import 'package:flutter/material.dart';

showDialogBox(
    String message, BuildContext context, String title, List<Widget> actions) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        title: Text(title),
        content: Text(message),
        actions: actions,
      );
    },
  );
}
