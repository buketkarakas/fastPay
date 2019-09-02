import 'package:flutter/material.dart';

class ParaGonderButon extends StatelessWidget {
  BuildContext context;
  Widget navi;
  String data;
  String butText;

  ParaGonderButon(this.context, this.navi, this.data, this.butText);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          navi != null
              ? Navigator.push(
                  context, MaterialPageRoute(builder: (context) => navi))
              : {};
        },
        child: Container(
          height: 70,
          child: Card(
              child: Container(
            padding: EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                data != null
                    ? Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 25,
                        child: Image.asset(
                          data,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
                Text(
                  butText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          )),
        ));
  }
}
