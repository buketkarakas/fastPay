import 'package:flutter/material.dart';

class IpucuKarti extends StatelessWidget {
  String baslik;
  String icerik;
  Color renk;

  IpucuKarti(this.baslik,this.icerik,this.renk);

  @override
  Widget build(BuildContext context) {
      return Container(
    height: 130,
    width: 250,
    color: renk,
    margin: EdgeInsets.only(top: 80, left: 20),
    child: Card(
        color: renk,
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 200, bottom: 3),
                child: Text("İpucu",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold))),
            Row(
              children: <Widget>[
                Container(
                  width: 150,
                  child: Text(baslik,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Icon(
                  Icons.location_on,
                  size: 22,
                  color: Colors.white54,
                ),
                Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.white30,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 150,
                    child: Text(
                      icerik,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    )),
                Icon(
                  Icons.location_on,
                  size: 45,
                  color: Colors.white,
                ),
                Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.white60,
                ),
              ],
            )
          ],
        )),
  );
  }
}