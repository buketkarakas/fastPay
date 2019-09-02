import '../Widgets/para_gonder_buton.dart';
import 'package:flutter/material.dart';
import "../Widgets/kart_list.dart";
import "../models.dart/kart.dart";
import '../Widgets/gecmis_islemler.dart';

class Islemler extends StatelessWidget {
  final List<Kart> _kartlar = [
    Kart("", "", "Kart/Hesap Ekle", Icons.add_circle_outline),
    Kart("DENİZBANKHESABIN", "", "6.274 TL", null),
    Kart("DENİZBONUS", "5200 19** **** 0535", "3560", null)
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Kart_list(),
          ),
          Container(
              child: ParaGonderButon(
                  context, null, "assets/Icons/paraGonder.png", "Para Gonder")),
          Container(
            child: ParaGonderButon(
                context, null, "assets/Icons/paraIste.png", "Para Çek/Para İste"),
          ),
          Container(
              child: ParaGonderButon(
                  context, null, "assets/Icons/odeYukle.png", "Öde/Yükle")),
          GecmisIslemler(),
        ],
      ),
    );
  }
}
