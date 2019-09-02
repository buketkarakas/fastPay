import 'package:flutter/material.dart';
import '../main.dart';

import './ayarlar_screen.dart';
import './degerlendirme_screen.dart';
import './sifre_islemleri_screen.dart';
import './hakkinda_screen.dart';
import './kim_onerdi_screen.dart';
import './yardim_screen.dart';

class Hesabim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HesabimState();
  }
}

class _HesabimState extends State<Hesabim> {
  String dil = 'Türkçe', sonSurum = '8.0.0';
  void initState() {
    super.initState();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Çıkış Yap"),
          content: new Text("Çıkış Yapmak istediğinize emin misiniz?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Evet"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ));
                //////////////////////////////çıkış yapılcak
              },
            ),
            new FlatButton(
              child: new Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget Hesabim() {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 8.0, left: 10.0),
      children: <Widget>[
        buton("Cüzdan İşlemleri",Ayarlar()),
        Container(
          height: 20,
        ),
        buton("Şifre İşlemleri",SifreIslemleri()),
        Container(
          height: 2,
        ),
        buton("Ayarlar", Ayarlar()),
        Container(
          height: 30,
        ),
        buton("Yardım",Yardim()),
        Container(
          height: 2,
        ),
        buton("fastPay Hakkında",Hakkinda()),
        Container(
          height: 30,
        ),
        buton("Uygulamayı Değerlendir",Degerlendirme()),
        Container(
          height: 2,
        ),
        buton("fastPay'i Kim Önerdi",KimOnerdi()),
        Container(
          height: 30,
        ),
        buton("Çıkış Yap",null),
        Container(
          child: Text('Versiyon ' + sonSurum),
          padding: EdgeInsets.only(top: 20, left: 150),
        ),
      ],
    );
  }

  InkWell buton(String title, Widget navi) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => navi));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
