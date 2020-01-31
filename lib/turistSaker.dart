import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'groups.dart';
import 'package:flutter_app_testing_coding/drawer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class TuristRoute extends StatefulWidget {

  const TuristRoute({ Key key }) : super(key: key);

  _turistState createState() => _turistState();

}

class _turistState extends State<TuristRoute> {

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
                Colors.blue.withOpacity(0.4),
              ],
            ),
          ),),
          ListView(
            padding: const EdgeInsets.fromLTRB(20,100,20,20),
            children: <Widget>[
              ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/43858429220_07a30ea7a8_c.jpg"), // no matter how big it is, it won't overflow
                ),
                title: Text('Byrums Raukar'),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(type: PageTransitionType.fade, child: ByrumPage(), duration: Duration(milliseconds: 500)),
                  );
                }
              ),
              ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/640px-Byxelkrok.jpg"), // no matter how big it is, it won't overflow
                ),
                title: Text('Byxelkroks sjöbodar'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.fade, child: ByxelkrokPage(), duration: Duration(milliseconds: 500)),
                    );
                  }
              ),
              ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/Lange_Erik_-_panoramio.jpg"), // no matter how big it is, it won't overflow
                ),
                title: Text('Långe Erik'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.fade, child: ErikPage(), duration: Duration(milliseconds: 500)),
                    );
                  }
              ),
              ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/DSC_4532.JPG"), // no matter how big it is, it won't overflow
                ),
                title: Text('Stenstranden'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.fade, child: StenstrandenPage(), duration: Duration(milliseconds: 500)),
                    );
                  }
              ),
              ListTile(
                contentPadding: EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/kaffestugan_1.jpg"), // no matter how big it is, it won't overflow
                ),
                title: Text('Kaffestugan'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.fade, child: KaffestuganPage(), duration: Duration(milliseconds: 500)),
                    );
                  }
              ),
              ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/37233585250_f7d0927be6_c.jpg"), // no matter how big it is, it won't overflow
                ),
                title: Text('Neptuni Åkrar'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.fade, child: NeptuniPage(), duration: Duration(milliseconds: 500)),
                    );
                  }
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
                'Sevärdigheter',
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

}


class ByrumPage extends StatefulWidget {

  @override
  _byrumState createState() => _byrumState();
}

class _byrumState extends State<ByrumPage> {

  @override
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
              ),
            ),
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
                    Colors.white.withOpacity(0.8),
                    Colors.blue.withOpacity(0.7),
                  ],
                ),
              ),),

              Positioned(
                top: 100,
                child: Image(
                  height: 250,
                  width: MediaQuery.of(context).size.width,

                  image: AssetImage("assets/images/43858429220_07a30ea7a8_c.jpg"),
                ),
              ),

            Positioned(
                top: 350,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ölands enda raukar bara ett stenkast från Böda, åk"
                    " dit och njut av när solen går ned över Blå jungfrun. ",
                    style: TextStyle(
                      fontSize: 20,

                    ),),)
            ),


            Align(
              alignment: Alignment(0.0, 0.95),

              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Card(

                  child: Padding(
                    padding: EdgeInsets.all(16.0),

                child:Text("hitta hit",
                style: TextStyle(
                    fontSize: 20,

                ),
                    textAlign: TextAlign.center),
            ),
                ),
                onTap: (){
                launchURL('https://www.google.com/maps/place/Byrums+Raukar/@57.2214807,16.8921709,13z/data=!4m5!3m4!1s0x0:0x81db9163efb180d5!8m2!3d57.2237034!4d16.952666');
                }

            ),
            ),

            new Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Byrums Raukar',
                  style: TextStyle(color: Colors.black,
                    fontSize: 25,),
                ),
                backgroundColor: Colors.transparent, //No more green
                elevation: 0.0, //Shadow gone
              ),
            ),],)
    );
  }
}

class ByxelkrokPage extends StatefulWidget {

  @override
  _byxelkrokState createState() => _byxelkrokState();
}

class _byxelkrokState extends State<ByxelkrokPage> {

  @override
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
              ),
            ),
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
                    Colors.white.withOpacity(0.8),
                    Colors.blue.withOpacity(0.7),
                  ],
                ),
              ),),

            Positioned(
              top: 100,
              child: Image(
                height: 250,
                width: MediaQuery.of(context).size.width,

                image: AssetImage("assets/images/640px-Byxelkrok.jpg"),
              ),
            ),

            Positioned(
                top: 350,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ölands enda raukar bara ett stenkast från Böda, åk"
                      " dit och njut av när solen går ned över Blå jungfrun. ",
                    style: TextStyle(
                      fontSize: 20,

                    ),),)
            ),


            Align(
              alignment: Alignment(0.0, 0.95),

              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Card(

                    child: Padding(
                      padding: EdgeInsets.all(16.0),

                      child:Text("hitta hit",
                          style: TextStyle(
                            fontSize: 20,

                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: (){
                    launchURL('https://www.google.com/maps/place/Byxelkroks+hamn/@57.3281751,17.0067777,19z/data=!4m5!3m4!1s0x4657d17b4478d1a7:0x62357b2bd0f69be7!8m2!3d57.3275793!4d17.0063129');
                  }

              ),
            ),

            new Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Byxelkrok sjöbodar',
                  style: TextStyle(color: Colors.black,
                    fontSize: 25,),
                ),
                backgroundColor: Colors.transparent, //No more green
                elevation: 0.0, //Shadow gone
              ),
            ),],)
    );
  }
}

class ErikPage extends StatefulWidget {

  @override
  _erikState createState() => _erikState();
}

class _erikState extends State<ErikPage> {

  @override
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
              ),
            ),
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
                    Colors.white.withOpacity(0.8),
                    Colors.blue.withOpacity(0.7),
                  ],
                ),
              ),),

            Positioned(
              top: 100,
              child: Image(
                height: 250,
                width: MediaQuery.of(context).size.width,

                image: AssetImage("assets/images/Lange_Erik_-_panoramio.jpg"),
              ),
            ),

            Positioned(
                top: 350,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ölands enda raukar bara ett stenkast från Böda, åk"
                      " dit och njut av när solen går ned över Blå jungfrun. ",
                    style: TextStyle(
                      fontSize: 20,

                    ),),)
            ),


            Align(
              alignment: Alignment(0.0, 0.95),

              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Card(

                    child: Padding(
                      padding: EdgeInsets.all(16.0),

                      child:Text("hitta hit",
                          style: TextStyle(
                            fontSize: 20,

                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: (){
                    launchURL('https://www.google.com/maps/place/L%C3%A5nge+Erik/@57.3711675,17.0834825,14z/data=!4m5!3m4!1s0x46f7fd21d6518bf7:0xf07d28a00dce7311!8m2!3d57.3663281!4d17.0978755');
                  }

              ),
            ),

            new Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Långe Erik',
                  style: TextStyle(color: Colors.black,
                    fontSize: 25,),
                ),
                backgroundColor: Colors.transparent, //No more green
                elevation: 0.0, //Shadow gone
              ),
            ),],)
    );
  }
}

class StenstrandenPage extends StatefulWidget {

  @override
  _stenstrandenState createState() => _stenstrandenState();
}

class _stenstrandenState extends State<StenstrandenPage> {

  @override
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
              ),
            ),
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
                    Colors.white.withOpacity(0.8),
                    Colors.blue.withOpacity(0.7),
                  ],
                ),
              ),),

            Positioned(
              top: 100,
              child: Image(
                height: 250,
                width: MediaQuery.of(context).size.width,

                image: AssetImage("assets/images/DSC_4532.JPG"),
              ),
            ),

            Positioned(
                top: 350,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ölands enda raukar bara ett stenkast från Böda, åk"
                      " dit och njut av när solen går ned över Blå jungfrun. ",
                    style: TextStyle(
                      fontSize: 20,

                    ),),)
            ),


            Align(
              alignment: Alignment(0.0, 0.95),

              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Card(

                    child: Padding(
                      padding: EdgeInsets.all(16.0),

                      child:Text("hitta hit",
                          style: TextStyle(
                            fontSize: 20,

                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: (){
                    launchURL('https://www.google.com/maps/place/Fornbo/@57.2025551,16.9042714,15z/data=!4m12!1m6!3m5!1s0x46f7fd8461e8f189:0x680656ae4af7572f!2sNeptuni+%C3%85krar!8m2!3d57.3463608!4d17.0267669!3m4!1s0x0:0x5525485c1644913b!8m2!3d57.2036729!4d16.9162041');
                  }

              ),
            ),

            new Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Stenstranden',
                  style: TextStyle(color: Colors.black,
                    fontSize: 25,),
                ),
                backgroundColor: Colors.transparent, //No more green
                elevation: 0.0, //Shadow gone
              ),
            ),],)
    );
  }
}

class KaffestuganPage extends StatefulWidget {

  @override
  _kaffestuganState createState() => _kaffestuganState();
}

class _kaffestuganState extends State<KaffestuganPage> {

  @override
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
              ),
            ),
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
                    Colors.white.withOpacity(0.8),
                    Colors.blue.withOpacity(0.7),
                  ],
                ),
              ),),

            Positioned(
              top: 100,
              child: Image(
                height: 250,
                width: MediaQuery.of(context).size.width,

                image: AssetImage("assets/images/kaffestugan_1.jpg"),
              ),
            ),

            Positioned(
                top: 350,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ölands enda raukar bara ett stenkast från Böda, åk"
                      " dit och njut av när solen går ned över Blå jungfrun. ",
                    style: TextStyle(
                      fontSize: 20,

                    ),),)
            ),


            Align(
              alignment: Alignment(0.0, 0.95),

              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Card(

                    child: Padding(
                      padding: EdgeInsets.all(16.0),

                      child:Text("hitta hit",
                          style: TextStyle(
                            fontSize: 20,

                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: (){
                    launchURL('https://www.google.com/maps/place/Kaffestugan+i+B%C3%B6da+AB/@57.2420228,17.0536091,15z/data=!4m5!3m4!1s0x46f7ff1877b429f7:0xf76396acf2e99277!8m2!3d57.2461205!4d17.058852');
                  }

              ),
            ),

            new Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Kaffestugan',
                  style: TextStyle(color: Colors.black,
                    fontSize: 25,),
                ),
                backgroundColor: Colors.transparent, //No more green
                elevation: 0.0, //Shadow gone
              ),
            ),],)
    );
  }
}

class NeptuniPage extends StatefulWidget {

  @override
  _neptuniState createState() => _neptuniState();
}

class _neptuniState extends State<NeptuniPage> {

  @override
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
              ),
            ),
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
                    Colors.white.withOpacity(0.8),
                    Colors.blue.withOpacity(0.7),
                  ],
                ),
              ),),

            Positioned(
              top: 100,
              child: Image(
                height: 250,
                width: MediaQuery.of(context).size.width,

                image: AssetImage("assets/images/37233585250_f7d0927be6_c.jpg"),
              ),
            ),

            Positioned(
                top: 350,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ölands enda raukar bara ett stenkast från Böda, åk"
                      " dit och njut av när solen går ned över Blå jungfrun. ",
                    style: TextStyle(
                      fontSize: 20,

                    ),),)
            ),


            Align(
              alignment: Alignment(0.0, 0.95),

              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Card(

                    child: Padding(
                      padding: EdgeInsets.all(16.0),

                      child:Text("hitta hit",
                          style: TextStyle(
                            fontSize: 20,

                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: (){
                    launchURL('https://www.google.com/maps/place/Neptuni+%C3%85krar/@57.3463608,17.0245782,17z/data=!3m1!4b1!4m5!3m4!1s0x46f7fd8461e8f189:0x680656ae4af7572f!8m2!3d57.3463608!4d17.0267669');
                  }

              ),
            ),

            new Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Neptuni Åkrar',
                  style: TextStyle(color: Colors.black,
                    fontSize: 25,),
                ),
                backgroundColor: Colors.transparent, //No more green
                elevation: 0.0, //Shadow gone
              ),
            ),],)
    );
  }
}

launchURL(url) async {
  //const url = 'https://www.google.se/maps/place/B%C3%B6dag%C3%A5rdens+Camping/@57.2586348,17.0482654,17z/data=!3m1!4b1!4m8!3m7!1s0x46f7fee2c478294d:0xddb1b62af6d8274c!5m2!4m1!1i2!8m2!3d57.2586319!4d17.0504541';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}