import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing_coding/main.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'Day.dart';
import 'drawer.dart';

class SchemaRoute extends StatefulWidget {
  const SchemaRoute({Key key}) : super(key: key);

  _schemaState createState() => _schemaState();
}

class _schemaState extends State<SchemaRoute> {
  Future<String> loadPersonFromAssets() async {
    var url = 'https://wrang308.github.io/json/schema.json';
    var data = await http.get(url);
    print('body++' + data.body + '++');
    return data.body;
  }

  Future loadPerson() async {
    String jsonString = await loadPersonFromAssets();
    final jsonResponse = json.decode(jsonString);
    Autogenerated day = new Autogenerated.fromJson(jsonResponse);
    print('day ${day.day[1].day}');
    print('day ${day.day[0].day}');
    return day;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        //removed
        drawer: MyDrawer(),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/hermansyah-7uXn7nudorc-unsplash.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.white.withOpacity(0.7),
                    Colors.white.withOpacity(0.5),
                    Colors.yellow[200].withOpacity(0.7),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: loadPerson(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                        child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.yellow,
                      ),
                    )
                        //Text('Loading...'),
                        ),
                  );
                }
                return PageView.builder(
                    controller: PageController(
                      initialPage: getWeekDay(),
                    ),
                    itemCount: snapshot.data.day.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.fromLTRB(0.0, 75.0, 0.0, 0.0),
                      child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          itemCount:
                              snapshot.data.day[index].activity.length + 1,
                          itemBuilder: (BuildContext context2, int index2) {
                            if (index2 == 0) {
                              return new Container(
                                  child: ListTile(
                                    title: Text(snapshot.data.day[index].day,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                        fontSize: 25,)),
                                    trailing:
                                        Text(snapshot.data.day[index].date),
                                  ),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          bottom: new BorderSide(
                                    color: Colors.black87,
                                  ))));
                            }

                            return Container(
                                child: ListTile(
                                  title: Text(
                                    snapshot.data.day[index].activity[index2 - 1].desc,
                                    style: TextStyle(fontSize: 20),),
                                  subtitle: Text(
                                    snapshot.data.day[index].activity[index2 - 1].starttime
                                    + '-' +
                                    snapshot.data.day[index].activity[index2 - 1].endtime,

                                  ),
                                ),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        bottom: new BorderSide(
                                  color: Colors.grey[200],
                                ))));
                          }));
                    });
              },
            ),
            new Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Schema',
                  style: TextStyle(color: Colors.black,
                      fontSize: 25,),
                ),
                backgroundColor: Colors.transparent, //No more green
                elevation: 0.0, //Shadow gone
              ),
            ),
          ],
        ));
  }

  Future getData() async {
    var url = 'https://unparliamentary-sam.000webhostapp.com/get.php';
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    print('getDtaa' + data.toString());
    return data;
  }

  @override
  void initState() {
    loadPerson();
    //getData();
    getWeekDay();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  int getWeekDay() {
    DateTime date = DateTime.now();
    print('date = ' + date.weekday.toString());
    return date.weekday - 1;
  }
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
            document['hej'] ?? 'error',
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
      } catch (err) {
        print(err.toString());
      }
    },
  );
}

class User {
  final String day;

  final Activity activity;

  User(this.day, this.activity);
}

class Activity {
  String desc;
  String endtime;
  String starttime;

  Activity({this.desc, this.endtime, this.starttime});
}
