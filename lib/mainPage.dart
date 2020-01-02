import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing_coding/secondRoute.dart';
import 'package:flutter_app_testing_coding/main.dart';
import 'package:flutter_app_testing_coding/schema.dart';
import 'package:flutter_app_testing_coding/grouptest.dart';
import 'drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

class MainPageRoute extends StatefulWidget {
  const MainPageRoute({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main Page Route"),
        ),
        drawer: MyDrawer(),
        body: Container(
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
          ),
          child: GridView.count(
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
                  child: Center(
                    child: CustomPaint(
                      painter:
                          CutOutTextPainter(text: 'Schema', color: Colors.cyan, textSize: 35.0),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupRoute()),
                    );
                  }, // handle your onTap here
                  child: Center(
                    child: CustomPaint(
                      painter:
                          CutOutTextPainter(text: 'Group', color: Colors.green, textSize: 35.0),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SchemaRoute()),
                    );
                  }, // handle your onTap here
                  child: Center(
                    child: CustomPaint(
                      painter:
                          CutOutTextPainter(text: 'Karta', color: Colors.purple, textSize: 35.0),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupRoute()),
                    );
                  }, // handle your onTap here
                  child: Center(
                    child: CustomPaint(
                      painter:
                          CutOutTextPainter(text: 'Sevärdigheter', color: Colors.white, textSize: 24.0),
                    ),
                  ),
                ),
              ]),
        ));
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

class CutOutTextPainter extends CustomPainter {
  CutOutTextPainter({this.text, this.color, this.textSize}) {
    _textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    _textPainter.layout();
  }

  final String text;
  final Color color;
  final double textSize;

  TextPainter _textPainter;

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    print(color.toString());
    // Draw the text in the middle of the canvas
    final textOffset =
        size.center(Offset.zero) - _textPainter.size.center(Offset.zero);
    final textRect = textOffset & _textPainter.size;
    print(textOffset.toString());
    print(textRect.toString());
    Rect myRect = const Offset(0.0, 0.0) & const Size(0.0, 0.0);
    print(myRect.toString());
    // The box surrounding the text should be 10 pixels larger, with 4 pixels corner radius
    final boxRect =
        RRect.fromRectAndRadius(myRect.inflate(75.0), Radius.circular(4.0));
    final boxPaint = Paint()
      ..color = color
      ..blendMode = BlendMode.srcOut;

    canvas.saveLayer(boxRect.outerRect, Paint());

    _textPainter.paint(canvas, textOffset);
    canvas.drawRRect(boxRect, boxPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CutOutTextPainter oldDelegate) {
    return text != oldDelegate.text;
  }
}
