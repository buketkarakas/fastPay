import '../Widgets/gecmis_islemler.dart';
import 'package:flutter/material.dart';

import '../Widgets/kart_list.dart';
import '../Widgets/para_gonder_buton.dart';

class OdeYukle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Öde/Yükle"),centerTitle: true,),
          body: SingleChildScrollView(
                      child: Column(
        children: <Widget>[
            Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: [
            Color.fromARGB(255, 88, 109, 243),
            Color.fromARGB(230, 23, 51, 138),
        ]),
         ),
         child: Kart_list(),
              
            ),
            ParaGonderButon(context, null, "assets/Icons/uyeIsYeri.png", "İşyeri Ödemesi Yap"),
            ParaGonderButon(context, null, "assets/Icons/istanbulCard.png", "İstanbulkart'a TL yükle"),
            ParaGonderButon(context, null, "assets/Icons/odeFatura.png", "Fatura Öde"),
            ParaGonderButon(context, null, "assets/Icons/creditCard.png", "Kredi Kartı Borcu Öde"),
            ParaGonderButon(context, null, "assets/Icons/gsmtlYukle.png","Cep Telefonuna TL Yükle" ),
            ParaGonderButon(context, null, "assets/Icons/oyunKodu.png", "Oyun Kodu Satın Al"),
            ParaGonderButon(context, null, "assets/Icons/aidatOde.png", "Aidat Öde"),
            GecmisIslemler()


        ],
        
  
      ),
          ),
    );
  }
}