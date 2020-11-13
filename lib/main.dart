import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tmna_admin_portal/Model/appinfo.dart';
import 'package:tmna_admin_portal/appdetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMNA',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SearchBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBar createState() => _SearchBar();
}

var modifiedAppInfo = originalAppInfo;
var searchTextControll = TextEditingController();

class _SearchBar extends State<SearchBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchTextControll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewWidth = MediaQuery.of(context).size.width;
    final viewHeight = MediaQuery.of(context).size.height;
    final containerViewHeight = 60.0;

    return Scaffold(
      body: Container(
        color: Colors.grey[10],
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: containerViewHeight,
              width: viewWidth,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 0),
                        width: viewWidth / 2,
                        height: containerViewHeight - 10,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                            color: Colors.red,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      child: Icon(Icons.search),
                                      onTap: () {
                                        print("Search tapped");
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, left: 8.0),
                                        child: TextField(
                                          keyboardType: TextInputType.name,
                                          controller: searchTextControll,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              hintText: 'Search',
                                              border: InputBorder.none,
                                              suffixIcon: IconButton(
                                                icon: Icon(Icons.clear),
                                                onPressed: () {
                                                  setState(() {
                                                    searchTextControll.clear();
                                                    modifiedAppInfo =
                                                        originalAppInfo;
                                                  });
                                                },
                                              )),
                                          onChanged: (searchString) {
                                            setState(() {
                                              if (searchString != '') {
                                                List<AppInfo> toAdd = [];
                                                originalAppInfo
                                                    .forEach((element) {
                                                  if (element.name
                                                      .toLowerCase()
                                                      .contains(searchString
                                                          .toLowerCase())) {
                                                    toAdd.add(element);
                                                  }
                                                });
                                                modifiedAppInfo = toAdd;
                                              } else {
                                                modifiedAppInfo =
                                                    originalAppInfo;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              width: viewWidth,
              height: viewHeight - containerViewHeight,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: modifiedAppInfo.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppDetail(
                                  selectedAppInfo: modifiedAppInfo[index],
                                )),
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 100,
                        color: Colors.grey[20],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(modifiedAppInfo[index].imageURL),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    modifiedAppInfo[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.visible,
                                  ),
                                  Wrap(
                                      spacing:
                                          8.0, // gap between adjacent chips
                                      runSpacing: 4.0, // gap between lines
                                      direction: Axis.horizontal,
                                      children: [
                                        Chip(
                                          backgroundColor: Colors.transparent,
                                          label: Text(
                                            modifiedAppInfo[index].description,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            maxLines: 3,
                                          ),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _materialAlertInit(context, "Roll back",
                                          "Are you sure want to rollback application from HU?");
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      child: Icon(
                                        Icons.repeat_rounded,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _materialAlertInit(
                                          context,
                                          'Install application',
                                          'Confirm before installing application to HU.');
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _materialAlertInit(
                                          context,
                                          'Delete application',
                                          'Confirm before deleting application from HU.');
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                },
              ),
            )
          ],
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
