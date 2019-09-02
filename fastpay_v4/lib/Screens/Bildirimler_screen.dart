import 'package:flutter/material.dart';

class Bildirimler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Bildirim gönderme izin vermediğin için hiç bildirimin yok.",
            style: TextStyle(color: Colors.grey, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          Image.asset("assets/images/gesmisIslemlerNull.png"),
          Text(
            "Önemli gelişmeleri sana haber verebilmem için bildirimleri açmak ister misin?",
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: RaisedButton(
              color: Colors.redAccent,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
              onPressed: () {},
              child: Text("Bildirimleri Aç",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
