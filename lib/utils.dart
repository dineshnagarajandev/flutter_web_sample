import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  static final Utils _singleton = Utils._internal();

  factory Utils() {
    return _singleton;
  }

  Utils._internal();

  Future<void> _iOSAlertInit(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _iosAlert(context);
      },
    );
  }

  Future<void> _materialAlertInit(
      BuildContext context, String alertTitle, String alertMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _materialAlert(context, alertTitle, alertMessage);
      },
    );
  }

  _materialAlert(BuildContext context, String alertTitle, String alertMessage) {
    return AlertDialog(
      title: Text(alertTitle),
      content: Text(alertMessage),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      elevation: 24.0,
      backgroundColor: Colors.white,
    );
  }

  _iosAlert(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Alert'),
      content: Text("Are you sure about this alert?"),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("No"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text("Yes"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
