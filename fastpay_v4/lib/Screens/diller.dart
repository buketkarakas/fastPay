import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models.dart/dil_response.dart';

class Diller extends StatefulWidget {
  @override
  _DillerState createState() => _DillerState();
}

class _DillerState extends State<Diller> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;

  _onChanged1(bool val) => setState(() => value1 = val);
  _onChanged2(bool val) => setState(() => value2 = val);
  _onChanged3(bool val) => setState(() => value3 = val);
  _onChanged4(bool val) => setState(() => value4 = val);
  LanguageData res;
  bool isLoading = true;

  Future<LanguageData> getlanguages() async {
    http.get(
        "*********************************************",
        headers: {
          'Content-Type': 'application/json'
        }).then((http.Response response) {
      if (response.statusCode != 200) print(response.statusCode);
      Map<String, Object> key = json.decode(response.body);
      res = LanguageData.fromJson(key["languageList"]);
      print(res.languageList[0].name);

      setState(() {
        isLoading = false;
      });
    });
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    if (i == 0) getlanguages();
    i++;
    var bar = AppBar(
      title: Text("Uygulama Dili"),
      backgroundColor: Colors.indigo[800],
    );
    return Scaffold(
      appBar: bar,
      body: Container(
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                color: Colors.transparent,
                margin: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 1 / 8,
                width: MediaQuery.of(context).size.width * 3 / 4,
                alignment: Alignment.center,
                child: Text(
                  "Uygulama dilini buradan değiştirebilirsin.",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                )),
            isLoading
                ? CircularProgressIndicator()
                : Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height*7/8-bar.preferredSize.height-65,
                    child: Column(children: <Widget>[
                      CheckboxListTile(
                        title: Text(res.languageList[0].name),
                        value: value1,
                        onChanged: _onChanged1,
                        activeColor: Colors.blue,
                      ),
                      CheckboxListTile(
                        title: Text(res.languageList[1].name),
                        value: value2,
                        onChanged: _onChanged2,
                        activeColor: Colors.blue,
                      ),
                      CheckboxListTile(
                        title: Text(res.languageList[2].name),
                        value: value3,
                        onChanged: _onChanged3,
                        activeColor: Colors.blue,
                      ),
                      CheckboxListTile(
                        title: Text(res.languageList[3].name),
                        value: value4,
                        onChanged: _onChanged4,
                        activeColor: Colors.blue,
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
