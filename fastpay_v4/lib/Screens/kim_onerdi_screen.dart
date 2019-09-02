import 'package:flutter/material.dart';

class KimOnerdi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: KimOnerdiPage(),
    );
  }
}

class KimOnerdiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KimOnerdiState();
  }
}

class _KimOnerdiState extends State<KimOnerdiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'fastPay i kim önerdi?',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: widgetForBodyDegerlendirme(),
    );
  }

  Widget widgetForBodyDegerlendirme() {
    return Container(
      color: Colors.blueAccent,
      height: 50,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
            ),
            Icon(Icons.face, size: 30),


          ],
        ),
      ),
    );
  }
}
