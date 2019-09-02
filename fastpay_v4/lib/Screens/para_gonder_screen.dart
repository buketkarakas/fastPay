import "../Widgets/gecmis_islemler.dart";
import 'package:flutter/material.dart';

import '../models.dart/kart.dart';
import '../Widgets/kart_list.dart';
import './cebe_para_gonder_screen.dart';
import '../Widgets/para_gonder_buton.dart';

class ParaGonder extends StatelessWidget {
  List<Kart> kartList = [
    Kart("", "", "Kart/Hesap Ekle", Icons.add_circle_outline),
    Kart("DENİZBANKHESABIN", "", "6.274 TL", null),
    Kart("DENİZBONUS", "5200 19** **** 0535", "3560", null)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Para Gönder"),
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  //Kart_list(kartList: kartList),
                  ParaGonderButon(context, CebeParaGonder(),
                      "assets/Icons/cebeParaGonder.png", "Cebe Para Gönder"),
                  ParaGonderButon(context, CebeParaGonder(), "assets/Icons/hesabaParaGonder.png",
                      "Hesaba Para Gönder"),
                  ParaGonderButon(context, CebeParaGonder(), "assets/Icons/fastNoktaPin.png",
                      "En yakın fast Nokta"),
                  GecmisIslemler(),
                ],
              ),
            )));
  }
}
