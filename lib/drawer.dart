import 'package:flutter/material.dart';
import 'package:flutter_app_testing_coding/ThirdRoute.dart';
import 'package:flutter_app_testing_coding/secondRoute.dart';
import 'package:flutter_app_testing_coding/main.dart';
import 'package:flutter_app_testing_coding/schema.dart';
import 'package:flutter_app_testing_coding/grouptest.dart';
import 'karta.dart';
import 'meny.dart';
import 'turistSaker.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(


      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(

        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
            DrawerHeader(
            child: Text('Böda Camp', style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.8, 1.0],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.blue,
                  Colors.yellow[300],
                ],
              ),
              image: DecorationImage(
                alignment: Alignment(1.0,1.0),
//fit: BoxFit.fill,
                image: AssetImage("assets/images/kindpng_3712009.png"),
              ),
            ),
          ),
          /**ListTile(
            title: Text('Item 4'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.pushNamed(context, '/forth');
              /**Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForthRoute())
              );**/
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ..
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.pushNamed(context, '/second');
             /** Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );*/
            },
          ),
          ListTile(
            title: Text('Item 5'),
            onTap: () {
              // Update the state of the app.
              // ...
              //Navigator.popUntil(context, ModalRoute.withName('/'));
              /**Navigator.canPop(context);
              Navigator.pushNamedAndRemoveUntil( context, '/fifth', ModalRoute.withName('/'));**/
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FifthRoute()),
              );
            },
          ),**/
          ListTile(
            title: Text('Schema'),
            onTap: () {
              // Update the state of the app.
              // ...
              //Navigator.pushReplacementNamed(context, '/schema');
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchemaRoute()),
              );
            },
          ),
          ListTile(
            title: Text('Grupper'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupRoute()),
              );
            },
          ),
          ListTile(
            title: Text('Mat'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenyRoute()),
              );
            },
          ),
          ListTile(
            title: Text('Sevärdigheter'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TuristRoute()),
              );
            },
          ),
          ListTile(
            title: Text('Karta'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KartaRoute()),
              );
            },
          ),

        ],
      ),
    );
  }
}