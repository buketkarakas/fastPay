import '../models.dart/kart.dart';
import 'package:flutter/material.dart';
import '../Screens/istanbulkart_screen.dart';

class Kart_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> text = [
      '',
      'DENİZBANK HESABIN',
      'BJK BONUS KLSAİK',
      'DENİZ BONUS',
      'NET KART MC',
      'FENERBAHÇE BONUS',
      'TEBBONUS',
      'YAPI KREDİ BANKASI',
      'İstanbul test',
      'İstanbul test',
      'tt',
      ' '
    ];

    return Container(
      color: Colors.indigo[800],
      height: MediaQuery.of(context).size.width * 0.50,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: text.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IstanbulKart()));
                      },
                      child: Card(
                        color: Colors.transparent,
                        semanticContainer: false,
                        elevation: 0,
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              /*Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                child: Image.asset(
                                  "assets/images/rectangleCopy10.png",
                                ),
                              ),*/
                              Container(
                                  margin: EdgeInsets.all(30),
                                  height: 30,
                                  child: Image.asset(
                                    "assets/images/ornament.png",
                                    fit: BoxFit.cover,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: index == 0
                                      ? Container(
                                          height: 20,
                                          child: Image.asset(
                                              "assets/images/fastPayLogotype.png",
                                              fit: BoxFit.cover))
                                      : Text(
                                          text[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          side:
                              new BorderSide(color: Colors.white54, width: 0.5),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  /*  return Container(
      margin: EdgeInsets.only(bottom: 100,top:10),
      width: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
              width: 140,
              child: InkWell(
                onTap: (() {
                   Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IstanbulKart(),
                ));
                }),
                focusColor: Colors.white,
                child: Card(
                  elevation: 10,
                  color: Colors.indigo[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          width: 1)),
                  child: Container(
                    width: 138,
                    padding: EdgeInsets.all(4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          //margin: EdgeInsets.only(right: 60, top: 3),
                          child: Text(
                            kartList[index].kartAdi,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 90, bottom: 0),
                          child: Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Text(
                            kartList[index].kartBakiyesi,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                letterSpacing: 0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
        scrollDirection: Axis.horizontal,
        itemCount: kartList.length,
      ),
    );
  }*/
}
