
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing_coding/drawer.dart';
import 'package:flutter_app_testing_coding/secondRoute.dart';
import 'package:flutter_app_testing_coding/ThirdRoute.dart';
import 'package:flutter_app_testing_coding/grouptest.dart';
import 'schema.dart';
import 'grouptest.dart';
import 'mainPage.dart';
import 'meny.dart';
import 'turistSaker.dart';
import 'karta.dart';

import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyApp());

int _counter = 0;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: MainPageRoute(), /**MyHomePage(title: 'Im trying to do stuff in the code'),**/

      initialRoute: '/' ,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        //'/': (context) => _buildPageView(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondRoute(),
        '/forth': (context) => ForthRoute(),
        '/fifth': (context) => FifthRoute(),
        '/schema': (context) => SchemaRoute(),
        '/group': (context) => GroupRoute(),
        '/meny': (context) => MenyRoute(),
        '/turistSaker': (context) => TuristRoute(),
        '/karta': (context) => KartaRoute(),
      },

    );
  }

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
  void initState() {
    //super.initState();
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('onMessage called: $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('onResume called: $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('onLaunch called: $message');
      },
    );

    firebaseMessaging.getToken().then((token){
      print('FCM Token: $token');
    });

  }
  /*FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    //super.initState();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token){
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }
*/
}

final controller = PageController(
  initialPage: 1,
);

Widget _buildPageView() {
  return PageView(
    children: <Widget>[
      ThirdRoute(),
      Container(
        color: Colors.lightGreen,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.purple,
      ),
      Container(
        color: Colors.brown,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.amber,
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.indigo,
      ),
      Container(
        color: Colors.deepOrange,
      ),
      SecondRoute(),
    ],
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('hej'),
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
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment(1, -1),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter'??'hej',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              onPressed: _decrementCounter,
              child: Text('Decrement it'),
              color: Colors.amber,
              textColor: Colors.black,
              //highlightColor: Colors.purple,
              splashColor: Colors.green,
            ),
            FlatButton(
              child: Text('Open route'),
              color: Colors.lightGreen,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
            FlatButton(
              child: Text('Open route'),
              color: Colors.lightGreen,
              onPressed: () {
                Navigator.pop(context);
                
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



class ForthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> text = [1, 2, 3, 4, 34, 56, 123, 67, 99, 234, 514, 354, 876, 5, 23];
    return Scaffold(
      appBar: AppBar(
        title: Text("hej"),
      ),
      body: Container(
        child: Column(
          children: [for (var i in text) Text(i.toString())],
        ),
      ),
    );
  }
}


class FifthRoute extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document.documentID +
              document['name'],
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['was'].toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ],
      ),
      onTap: () {

        Firestore.instance.runTransaction((transaction) async {
          DocumentSnapshot freshSnap =
          await transaction.get(document.reference);
          await transaction.update(freshSnap.reference, {
            'was': freshSnap['was'] + 1,
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FifthRoute Route"),
      ),
      drawer: MyDrawer(),
      body: StreamBuilder(
          stream: Firestore.instance.collection('test').document('groups').collection('group').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }),
    );
  }
}
