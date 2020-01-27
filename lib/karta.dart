import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'groups.dart';
import 'package:flutter_app_testing_coding/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;
import 'package:photo_view/photo_view.dart';

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
                    backgroundImage: AssetImage("assets/images/Bodagarden_karta-725x1024.jpg"), // no matter how big it is, it won't overflow
                  ),
                  title: Text('Karta över gården'),
                  onTap: () {
                    //Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.fade, child: GardKartaRoute(), duration: Duration(milliseconds: 500)),
                    );
                  },
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

class GardKartaRoute extends StatefulWidget {

  const GardKartaRoute({ Key key }) : super(key: key);

  _gardkartaState createState() => _gardkartaState();

}


class _gardkartaState extends State<GardKartaRoute> {

  Widget build(BuildContext context) {

    return Scaffold(
        drawer: MyDrawer(),

        body: Stack(
          children: <Widget>[
            Container(
        child: PhotoView(
            imageProvider: AssetImage("assets/images/Bodagarden_karta_2019-1.jpg"),
            ),
               /**decoration: BoxDecoration(
                image: DecorationImage(
                  image: new ZoomableImage(new AssetImage("assets/images/Bodagarden_karta-725x1024.jpg"), scale: 16.0),
                  fit: BoxFit.fill,
                ),**/

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

}

class InteractiveImage extends StatefulWidget {
  InteractiveImage(this.image, {Key key}) : super(key: key);

  final Image image;

  @override
  _InteractiveImageState createState() => new _InteractiveImageState();
}

class _InteractiveImageState extends State<InteractiveImage> {
  _InteractiveImageState();

  double _scale = 1.0;
  double _previousScale = null;

  @override
  Widget build(BuildContext context) {
    setState(() => print("STATE SET\n"));
    return Scaffold(
        drawer: MyDrawer(),

    body: new GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        print(details);
        // Does this need to go into setState, too?
        // We are only saving the scale from before the zooming started
        // for later - this does not affect the rendering...
        _previousScale = _scale;
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        print(details);
        setState(() => _scale = _previousScale * details.scale);
      },
      onScaleEnd: (ScaleEndDetails details) {
        print(details);
        // See comment above
        _previousScale = null;
      },
      child: new Transform(
        transform: new Matrix4.diagonal3(new Vector.Vector3(_scale, _scale, _scale)),
        alignment: FractionalOffset.center,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Bodagarden_karta-725x1024.jpg"),
              fit: BoxFit.fill,
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
      ),
    ),);
  }
}