import 'package:flutter/material.dart';
import 'package:tmna_admin_portal/Model/appinfo.dart';

class AppDetail extends StatelessWidget {
  final AppInfo selectedAppInfo;
  AppDetail({Key key, @required this.selectedAppInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedAppInfo.name),
      ),
      body: WillPopScope(
        onWillPop: () async => true,
        child: Center(
          child: Container(
            width: screenWidth / 1.05,
            height: screenHeight / 1.1,
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 250,
                  // color: Colors.yellow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.white,
                          child: Image.network(selectedAppInfo.imageURL),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Wrap(children: [
                              Chip(
                                backgroundColor: Colors.transparent,
                                label: Text(
                                  selectedAppInfo.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Wrap(children: [
                              Chip(
                                backgroundColor: Colors.transparent,
                                label: Text(
                                  selectedAppInfo.description,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 3,
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                      Container(
                        // color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: GestureDetector(
                                    onTap: () {
                                      _materialAlertInit(context, "Roll back",
                                          "Are you sure want to rollback application from HU?");
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Center(
                                            child: Text(
                                          "Roll back",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: GestureDetector(
                                    onTap: () {
                                      _materialAlertInit(
                                          context,
                                          'Delete application',
                                          'Confirm before deleting application from HU.');
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Center(
                                            child: Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: GestureDetector(
                                    onTap: () {
                                      _materialAlertInit(
                                          context,
                                          'Install application',
                                          'Confirm before installing application to HU.');
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Center(
                                            child: Text(
                                          "Install",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: screenWidth / 1.05,
                //   height: 400,
                //   color: Colors.yellow,
                // )
              ],
            ),
          ),
        ),
      ),
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
}
