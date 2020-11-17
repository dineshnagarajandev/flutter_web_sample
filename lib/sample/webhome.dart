import 'package:flutter/material.dart';
import 'package:tmna_admin_portal/sample/webnavbar.dart';

class WebHome extends StatelessWidget {
  const WebHome({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(195, 20, 50, 1.0),
              Color.fromRGBO(36, 11, 54, 1.0)
            ])),
        child: Column(
          children: [WebNavBar()],
        ),
      ),
    );
  }
}
