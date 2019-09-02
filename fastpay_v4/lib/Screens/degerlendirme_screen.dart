import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

class Degerlendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DegerlendirmePage(),
    );
  }
}

class DegerlendirmePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DegerlendirmeState();
  }
}

class _DegerlendirmeState extends State<DegerlendirmePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
      body: widgetForBodyDegerlendirme(),
    );
  }

  double rating;
  Widget widgetForBodyDegerlendirme() {
    return Column(children: <Widget>[
      Container(
        color: Colors.indigo[800],
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset("assets/Icons/01.png", fit: BoxFit.cover),
            new Text(
              'FastPayden Memnun Musunuz?',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            new Text(
              'Sana daha iyi hizmet verebilmem için birkaç',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            new Text(
              'saniyeni ayırıp FastPayi değerlendirmek',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            new Text(
              'ister misin?',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SmoothStarRating(
              color: Colors.amberAccent[700],
              onRatingChanged: (v) {
                setState(() {
                  rating = v;
                });
              },
              allowHalfRating: false,
              borderColor: Colors.grey,
              rating: rating,
              starCount: 5,
              size: 40,
              spacing: 10,
            ),
          ],
        ),
      ),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextField()),
      Container(
        margin: EdgeInsets.only(top: 140),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.red,
                elevation: 5,
                onPressed: () {},
              ),
            )
          ],
        ),
      )
    ]);
  }
}
