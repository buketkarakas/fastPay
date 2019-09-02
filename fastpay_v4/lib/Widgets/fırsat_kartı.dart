import 'package:flutter/material.dart';

class Firsat extends StatelessWidget {
  String resim;
  String baslik;
  String altbaslik;
  String yazi;
  String kucukResim;

  Firsat({this.baslik, this.altbaslik, this.kucukResim, this.resim, this.yazi});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              width: 320,
              child: InkWell(
                  onTap: () {},
                  child: Card(
                      child: Column(
                    children: <Widget>[
                      Image.network(resim, fit: BoxFit.cover),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 10, top: 2),
                        child: Text(baslik,
                            style: TextStyle(
                                color: Colors.indigo[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 10, top: 2),
                        child: Text(altbaslik,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                      Container(
                        width: 300,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 10, top: 2, bottom: 2),
                        child: Text(yazi,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12)),
                      ),
                    ],
                  ))),
            ),
            Container(
                height: 22,
                width: 51,
                child: Card(
                  elevation: 10,
                  color: Color.fromRGBO(93, 201, 188, 3),
                  child: Text(
                    "Yeni",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ))
          ]),
        ],
      ),
    );
  }
}
