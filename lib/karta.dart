import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'groups.dart';
import 'package:flutter_app_testing_coding/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class KartaRoute extends StatefulWidget {

  const KartaRoute({ Key key }) : super(key: key);

  _kartaState createState() => _kartaState();

}

class _kartaState extends State<KartaRoute> {

  Widget build(BuildContext context) {

    return Scaffold(
        drawer: MyDrawer(),

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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.white.withOpacity(0.5),
                    Colors.purple.withOpacity(0.4),
                  ],
                ),
              ),),
            ListView(
              padding: const EdgeInsets.fromLTRB(20,100,20,20),
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/byrums-raukar-bla-jungfrun.jpg"), // no matter how big it is, it won't overflow
                  ),
                  title: Text('Hitta hit!'),
                  onTap: _launchURL,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/byrums-raukar-bla-jungfrun.jpg"), // no matter how big it is, it won't overflow
                  ),
                  title: Text('Karta över gården'),
                ),
              ],
            ),
            new Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Karta',
                  style: TextStyle(color: Colors.black,
                    fontSize: 25,),
                ),
                backgroundColor: Colors.transparent, //No more green
                elevation: 0.0, //Shadow gone
              ),
            ),],)
    );


  }

  @override
  void initState() {

  }
  _launchURL() async {
    const url = 'https://www.google.se/maps/place/B%C3%B6dag%C3%A5rdens+Camping/@57.2586348,17.0482654,17z/data=!3m1!4b1!4m8!3m7!1s0x46f7fee2c478294d:0xddb1b62af6d8274c!5m2!4m1!1i2!8m2!3d57.2586319!4d17.0504541';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}