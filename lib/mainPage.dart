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

        body: GridView.count(
    primary: false,
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    crossAxisCount: 2,
    children: <Widget>[
      InkWell(

        onTap: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SchemaRoute()),
          );
        }, // handle your onTap here
        child: Container(height: 200, width: 200,
        color: Colors.cyan,
        child: Text('Schema'),),
      ),
      InkWell(

        onTap: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupRoute()),
          );
        }, // handle your onTap here
        child: Container(height: 200, width: 200,
        color: Colors.amber,
        child: Text('Group'),),
      ),

    ]),
        /**ListView(children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            child: Text('Go back!'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchemaRoute()),
              );
            },
            child: Text('Schema'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupRoute()),
              );
            },
            child: Text('Grupper'),
          ),

        ])
    **/);
  }
}