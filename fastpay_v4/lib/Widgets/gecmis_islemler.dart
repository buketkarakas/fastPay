import 'package:flutter/material.dart';

class GecmisIslemler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 5, top: 15),
            child: Text(
              "Geçmiş İşlemler",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
        Container(
            height: 300,
            width: 350,
            child: Card(
                elevation: 10,
                color: Colors.white,
                child: Text("Geçmiş işlemlere ait bilgileri göster. "))),
      ],
    );
  }
}
