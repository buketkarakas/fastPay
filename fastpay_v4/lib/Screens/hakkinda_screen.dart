import 'package:flutter/material.dart';

class Hakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HakkindaPage(),
    );
  }
}

class HakkindaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HakkindaState();
  }
}

class _HakkindaState extends State<HakkindaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text(
          'fastPay Hakkında',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
        ],
        leading: new Container(),
      ),
      body: widgetForBodyDegerlendirme(),
    );
  }

  Widget widgetForBodyDegerlendirme() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hayatını kolaylaştıracak güzellikler fastPay’le olur! Nasıl mı?",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            "Yanında paran olmasa bile istanbulkart’ına dilediğin yerde yüklemeni yaparsın.",
            style: TextStyle(fontSize: 15),
          ),
          Text("Hiçbir masraf ödemeden faturalarını ödersin."),
          Text(
              "Eft saatini dert etmezsin, dilediğin kişiye 7/24 ücretsiz para gönderirsin.",
              style: TextStyle(fontSize: 15)),
          Text(
              "Oyun kodlarını kolayca satın alır, şans oyunu ödemelerini yaparsın.",
              style: TextStyle(fontSize: 15)),
          Text(
              "İnternet alışverişlerinde kart bilgilerini girmeden hızlı ve güvenli şekilde ödersin.",
              style: TextStyle(fontSize: 15)),
          Text(
              "Anlaşmalı iş yerlerinde indirimlerden faydalanır, ödemeni cüzdansız yaparsın.",
              style: TextStyle(fontSize: 15)),
          Text(
              "Bütün bunları yapmak için dilediğin bankanın kredi kartını kaydedip, fastPay’in tüm güzelliklerinden ücretsiz faydalanabilirsin.",
              style: TextStyle(fontSize: 15)),
          Text(
              "Kredi kartın yoksa üzülme, nakit paranı herhangi bir DenizBank ATM’sinden fastPay hesabına yükleyebilir, fastPay dünyasına sen de dalabilirsin.",
              style: TextStyle(fontSize: 15)),
          Text("\"Olur mu öyle şey\" dediğin birçok güzellik fastPay’le olur!",
              style: TextStyle(fontSize: 15))
        ],
      ),
    );
  }
}
