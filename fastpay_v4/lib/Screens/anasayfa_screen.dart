import 'package:fastpay_v4/Widgets/kart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models.dart/kart.dart';
import '../Widgets/Hızlı_islemler.dart';
import '../Widgets/Islem_kart.dart';
import '../Widgets/Ipucu_kartı.dart';
import '../Widgets/Seçilen_Fırsatlar.dart';

class AnasayfaScreen extends StatefulWidget {
  @override
  _AnasayfaScreenState createState() => _AnasayfaScreenState();
}

class _AnasayfaScreenState extends State<AnasayfaScreen> {
  Widget _ustReklam(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 88, 109, 243),
        Color.fromARGB(230, 23, 51, 138),
      ])),
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Stack(children: <Widget>[
        Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/a101HeroBanner.png")),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "A101'de fastPay'le öde,",
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, letterSpacing: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text(
                  "10 TL + %10 iade cebinde!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  elevation: 5,
                  color: Colors.deepOrange,
                  onPressed: () {},
                  child: Text("Ödemeni Yap"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.red)),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _ortaGovde(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Kart_list(),
    );
  }

  Widget _altGovde() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HizliIslemler(),
            SecilenFirsatlar(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  IpucuKarti(
                      "Cüzdanın yanında olmasa bile",
                      "Tüm Denizbank ATM'lerinden kartsız para çekebilirsin",
                      Color(0XFF283593)),
                  IpucuKarti(
                      "Bir bankada hesabın olmasa bile",
                      "Tüm DenizBank ATM'lerinden fastPay bakiyene para yükleyebilirsin",
                      Color(0XFFFF9100))
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            primary: true,
            child: Column(
              children: <Widget>[
                _ustReklam(context),
                Stack(children: <Widget>[
                  _ortaGovde(context),
                  _altGovde(),
                ]),
              ],
            )));
  }
}
