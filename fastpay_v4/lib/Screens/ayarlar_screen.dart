import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './diller.dart';
class Ayarlar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AyarlarPage(),
    );
  }
}

class AyarlarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AyarlarState();
  }
}

class _AyarlarState extends State<AyarlarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo[800],
        title: new Text(
          'Ayarlar',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body:Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * 1 / 8,
            child: Text(
              "Tüm uygulama ayarlarını buradan güncelleyebilirsin.",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 0.5),
              textAlign: TextAlign.center,
            ),
          ),InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Diller()));
        },
        child: Container(
          margin: EdgeInsets.only(top: 5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (1 / 8),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Uygulama Dili",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "English",
                      style: Theme.of(context).textTheme.body1,
                    )
                  ]),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          ),
        ),
      ),kaydirmaliButon(
            "Hızlı Ode",
            "Açık olduğunda giriş yapmadan üye işyerlerinde kolayca ödeme yapabilirsin.",
            _value1_tile1,
            _onChanged1_tile1,
          ),
          kaydirmaliButon(
              "Para Talepleri",
              "Açık olduğunda diğer kullanıcılar senden para isteyebilir",
              _value1_tile2,
              _onChanged1_tile2),
          kaydirmaliButon(
              "Yan Ekranda Kare Kod Üretme",
              "Açık olduğunda telefonunu yan çevirdiğinde kare kod üretilir.",
              _value1_tile3,
              _onChanged1_tile3)]),
      ),
      );
          
  
  }

  bool isLoading = false;

  void _onChanged1_tile1(bool value) {
    setState(() => _value1_tile1 = value);
  }

  void _onChanged1_tile2(bool value) => setState(() => _value1_tile2 = value);

  void _onChanged1_tile3(bool value) => setState(() => _value1_tile3 = value);

 



//1.butom
  bool _value1_tile1 = false;

//2.buton
  bool _value1_tile2 = false;

//3.buton
  bool _value1_tile3 = false;

  Widget kaydirmaliButon(
      String title, String subtitle, bool val, Function change) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * (1 / 8),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      subtitle,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ]),
            Switch(
              value: val,
              onChanged: change,
              activeTrackColor: Colors.greenAccent,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
