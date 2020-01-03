import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'groups.dart';

class TuristRoute extends StatefulWidget {

  const TuristRoute({ Key key }) : super(key: key);

  _turistState createState() => _turistState();

}

class _turistState extends State<TuristRoute> {

  Widget build(BuildContext context) {

    return Scaffold(
      //removed
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/hermansyah-7uXn7nudorc-unsplash.jpg"),
                fit: BoxFit.cover,
              ),

              /**
                  gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.3, 0.7],
                  colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.pink[100],
                  Colors.white,
                  Colors.yellow[100],
                  ],
                  ),**/
            ),),
        Container(
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.amber[100].withOpacity(0.0),
                Colors.yellow[200].withOpacity(0.5),
              ],
            ),
          ),),
          ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/byrums-raukar-bla-jungfrun.jpg"), // no matter how big it is, it won't overflow
                ),
                title: Text('Byrums Raukar'),
              ),
            ],
          ),],)
        );


  }

  @override
  void initState() {

  }

}