import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing_coding/secondRoute.dart';
import 'package:flutter_app_testing_coding/main.dart';
import 'package:flutter_app_testing_coding/schema.dart';
import 'package:flutter_app_testing_coding/grouptest.dart';
import 'drawer.dart';


class MainPageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main Page Route"),
        ),
        drawer: MyDrawer(),

        body: ListView(children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            child: Text('Go back!'),
          ),
          
        ]));
  }
}