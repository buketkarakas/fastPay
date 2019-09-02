import 'package:flutter/material.dart';

Widget yukleme(String tarih, String tutar) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            tarih,
            style: TextStyle(color: Colors.grey[400], fontSize: 10),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Ulaşım Kartı Yüklemesi",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            Text(tutar,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text("İTANBULKART-048130EA713B80",
              style: TextStyle(color: Colors.grey[400], fontSize: 13)),
        ),
        Row(
          children: <Widget>[
            InkWell(
                onTap: () {},
                child: Icon(
                  Icons.repeat,
                  color: Colors.indigo[800],
                )),
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                  onTap: () {},
                  child: Text("Tekrarla",
                      style: TextStyle(
                          color: Colors.indigo[800],
                          fontSize: 12,
                          fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.library_books,
                    color: Colors.indigo[800],
                  )),
            ),
            InkWell(
                onTap: () {},
                child: Text("Dekont",
                    style: TextStyle(
                        color: Colors.indigo[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold)))
          ],
        )
      ],
    ),
  );
}

Widget stackScreen() {
  return new Container(
    height: 1150,
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Card(
                  margin: EdgeInsets.only(bottom: 20, top: 120),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.black38)),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: Colors.indigo[800],
                          ),
                          Container(
                              padding: EdgeInsets.only(right: 130, left: 5),
                              child: Text(
                                "Ulaşım Kartına TL Yükle",
                                style: TextStyle(fontSize: 15),
                              )),
                          Icon(Icons.arrow_forward_ios, color: Colors.black26)
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5, top: 5, bottom: 120),
              child: InkWell(
                onTap: () {},
                child: Text("Bu kartı Cüzdandan Kaldır",
                    style: TextStyle(color: Colors.indigo)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 5, top: 5, bottom: 120),
              child: InkWell(
                onTap: () {},
                child: Text("Kart Adı Değiştir",
                    style: TextStyle(color: Colors.indigo)),
              ),
            )
          ],
        ),
        Container(
          color: Colors.grey[200],
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(bottom: 5, left: 4),
                  child: Text(
                    "Geçmiş İşlemler",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 4, bottom: 5),
                  child: Text("Filtrele"),
                ),
              )
            ],
          ),
        ),
        yukleme("16.07.2019", "-10.00 TL"),
        yukleme("16.07.2019", "-10.00 TL"),
        yukleme("16.07.2019", "-10.00 TL"),
        yukleme("16.07.2019", "-10.00 TL"),
        yukleme("16.07.2019", "-10.00 TL"),
        yukleme("16.07.2019", "-10.00 TL"),
        RaisedButton(
          onPressed: () {},
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.black54)),
          child: Text("Tüm Geçmiş İşlemler",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        )
      ],
    ),
  );
}

class IstanbulKart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
          title: Text(
            "Ulaşım Kartı Detayları",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close))
          ],
        ),
        body: ListView(children: <Widget>[
          Stack(children: <Widget>[
            // The containers in the background
            new Column(
              children: <Widget>[
                new Container(
                  height: 130,
                  color: Colors.indigo[800],
                ),
                stackScreen()
              ],
            ),
            // The card widget with top padding,
            // incase if you wanted bottom padding to work,
            // set the `alignment` of container to Alignment.bottomCenter
            new Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(top: 50, right: 20.0, left: 20.0),
              child: new Container(
                height: 180.0,
                width: 250,
                child: new Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey[300],
                  elevation: 4.0,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 5, top: 5),
                    height: 150,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              " İstanbul Test",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "İSTANBULKART",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 5),
                                  height: 45,
                                  child: Image.asset(
                                    "assets/images/ibb.png",
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ],
                            )),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5),
                          child: Text("0481 30EA 713B 80",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, top: 40),
                          child: Text("Kart Bakiyesi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5),
                          child: Text("0,00 TL",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]));
  }
}
