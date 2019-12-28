

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class SchemaRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schema Route"),
      ),
      body: /**StreamBuilder(
          stream: Firestore.instance.collection('schema'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            print(snapshot);
            print('*Hejsan!*');
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: 1, //snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data),
            );
          }),**/
      _buildPageView(),
    );
  }
}


Widget _buildPageView() {
  return PageView(
    children: <Widget>[
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
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.grey.withOpacity(.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Header",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("Feb 26th, 2019",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black45,
                      )),
                ],
              ),
              padding: EdgeInsets.all(10.0),
            ),
             ListTile(
               title: Text('HEJ'),
               trailing: Text('10:00-12:00'),
             ),
            ListTile(
              title: Text('ASD'),
              trailing: Text('12:00-13:00'),
            ),
            ListTile(
              title: Text('WASD'),
              trailing: Text('13:00-14:00'),
            ),
            ListTile(
              title: Text('WASP'),
              trailing: Text('14:00-15:00'),
            ),
          ],
        ),
      ),
      _buildContainer(Colors.cyan),
    ],
  );
}

Widget _buildContainer(Color color){
  return Container(
    color: color,

  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: HeaderRowListView(),
    );
  }
}


class HeaderRowListView extends StatelessWidget {



  final List<int> _listData = List<int>.generate(100, (i) => i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Header Row Example'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: _listData.map((i) {
          return i % 10 == 0
              ? Container(
            color: Colors.grey.withOpacity(.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Header",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
                Text("Feb 26th, 2019",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black45,
                    )),
              ],
            ),
            padding: EdgeInsets.all(10.0),
          )
              : ListTile(
            title: Text("Item $i"),
          );
        }).toList(),
      ),
    );
  }
}





Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return ListTile(
    title: Row(
      children: [
        Expanded(
          child: Text(
            document['hej']??'error',
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
      try {
        Firestore.instance.runTransaction((transaction) async {
          DocumentSnapshot freshSnap =
          await transaction.get(document.reference);
          print('freshsnap = ' + freshSnap['was'].toString());
          await transaction.update(freshSnap.reference, {
            'was': freshSnap['was'] + 1,
          });
        });
      } catch(err){
        print(err.toString());
      }

    },
  );
}