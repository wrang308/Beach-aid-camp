import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing_coding/secondRoute.dart';
import 'package:flutter_app_testing_coding/main.dart';
import 'package:flutter_app_testing_coding/schema.dart';


class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Third Route"),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 4'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForthRoute()),
                  );
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
              ListTile(
                title: Text('Item 5'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FifthRoute()),
                  );
                },
              ),
              ListTile(
                title: Text('Schema'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SchemaRoute()),
                  );
                },
              ),
            ],
          ),
        ),
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
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry D')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry E')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry F')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry G')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry H')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry I')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry J')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry K')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry L')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry M')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry N')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry O')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry P')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry Q')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry R')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry S')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry T')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry U')),
          ),
        ]));
  }
}