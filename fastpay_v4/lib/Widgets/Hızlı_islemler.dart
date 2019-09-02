import '../Screens/para_gonder_screen.dart';

import '../Screens/istanbulkart_screen.dart';

import '../Screens/OdeYukle.dart';
import 'package:flutter/material.dart';
import './Islem_kart.dart';

class HizliIslemler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IslemKart(
                    "assets/Icons/odeYukle.png", "Pay/Top-up", OdeYukle()),
                IslemKart(
                    "assets/Icons/paraGonder.png", "Send Money", ParaGonder())
              ]),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IslemKart("assets/Icons/istanbulCard.png", "City Card Top-up",
                    IstanbulKart()),
                IslemKart("assets/Icons/uyeIsYeri.png", "Make Payement", null),
              ]),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IslemKart(
                    "assets/Icons/fastNoktaPin.png", "Nearest fastPoint", null),
                IslemKart(
                    "assets/Icons/oyunKodu.png", "Buy Digital Code", null),
              ])
        ],
      ),
    );
  }
}
