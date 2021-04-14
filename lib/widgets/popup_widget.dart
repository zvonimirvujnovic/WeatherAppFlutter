import 'package:flutter/material.dart';
import 'package:WeatherAppFlutterVujnovic/style/strings.dart';

showLoadingIndicator(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: CircularProgressIndicator(),
    ),
  );
}

dismissDialog(BuildContext context) {
  Navigator.of(context).pop();
}

showTextDialog(BuildContext context, String text) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
      actions: [
        FlatButton(
          onPressed: () => dismissDialog(context),
          child: Text(buttonTextOK),
        )
      ],
    ),
  );
}
