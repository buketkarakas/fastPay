import 'package:flutter/material.dart';
import '../Screens/para_gonder_screen.dart';
import '../Screens/cebe_para_gonder_screen.dart';

class IslemKart extends StatelessWidget {
  final String baslik;
  final String image;
  final Widget navi;

  IslemKart(this.image, this.baslik, this.navi);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => navi));
            },
            child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey[300])),
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 80,
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            baslik,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          alignment: Alignment.bottomRight,
                          width: 150,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.only(right: 5),
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ))
                    ]))));
  }
}
