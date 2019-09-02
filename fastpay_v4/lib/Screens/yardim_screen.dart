import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../models.dart/token_response.dart';
import '../models.dart/yardim_menu.dart';

class Yardim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: YardimPage(),
    );
  }
}

class YardimPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _YardimState();
  }
}

class _YardimState extends State<YardimPage> {
  static String sessionID = "";
  YardimMenu result;
  int keyDown = -1;
  int keyDownSub = -1;
  bool isLoading = true;
  Future<void> auth() async {
    var payload = {
      "appVersion": "7.3.5",
      "appName": "fastPay",
      "clientKey": "",
      "device": {
        "hasNfc": false,
        "deviceCode": "",
        "make": "generalmobile",
        "model": "GM 6 d",
        "os": {"family": "Android", "version": "19"}
      },
      "localeVersion": "",
    };

    var jsonString = json.encode(payload);

    return http.post('https://fastpaydev.denizbank.com/api/auth/token',
        body: jsonString,
        headers: {
          'Content-Type': 'application/json'
        }).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while taking token data");
      }
//get data from response
      Map<String, Object> key = jsonDecode(utf8.decode(response.bodyBytes));
      AuthTokenResponse res = AuthTokenResponse.fromJson(key);

// hash of token

      sessionID = md5.convert(utf8.encode(res.token)).toString();
    });
  }

  Future<void> helpmenu() async {
    await auth();

    return http.get('https://fastpaydev.denizbank.com/api/helpmenu', headers: {
      "hash": sessionID,
      'Accept': 'application/json',
    }).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while taking help menu");
      }
      Map<String, dynamic> key = jsonDecode(response.body);
      result = new YardimMenu.fromJson(key);

      setState(() {
        isLoading = false;
      });
    });
  }

  int key = 0;

  @override
  Widget build(BuildContext context) {
    if (key == 0) {
      helpmenu();
      key++;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo[800],
        title: Text("fastPay"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: widgetForBodyDegerlendirme(),
    );
  }

  Widget subMenu(int index) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        for (int i = 0; i < result.menu.submenu[index].subMenu2.length; i++)
          keyDownSub == i
              ? Column(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.grey, width: 0.5))),
                    child: ListTile(
                      title: Text(result.menu.submenu[index].subMenu2[i].title),
                      trailing: keyDownSub != i
                          ? Icon(Icons.keyboard_arrow_down)
                          : Icon(Icons.keyboard_arrow_up),
                      onTap: () {
                        setState(() {
                          if (keyDownSub == i)
                            keyDownSub = -1;
                          else
                            keyDownSub = i;
                        });
                      },
                    ),
                  ),
                  tavsiyeMenu(index, i)
                ])
              : Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.5))),
                  child: ListTile(
                    title: Text(result.menu.submenu[index].subMenu2[i].title),
                    trailing: keyDownSub != i
                        ? Icon(Icons.keyboard_arrow_down)
                        : Icon(Icons.keyboard_arrow_up),
                    onTap: () {
                      setState(() {
                        if (keyDownSub == i)
                          keyDownSub = -1;
                        else
                          keyDownSub = i;
                      });
                    },
                  ))
      ]),
    );
  }

  Widget tavsiyeMenu(int index, int index2) {
    return Container(
      child: Column(
        children: <Widget>[
          for (int i = 0;
              i < result.menu.submenu[index].subMenu2[index2].subMenu3.length;
              i++)
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                child: ListTile(
                  title: Text(result
                      .menu.submenu[index].subMenu2[index2].subMenu3[i].title),
                ))
        ],
      ),
    );
  }

  Widget widgetForBodyDegerlendirme() {
    return isLoading
        ? CircularProgressIndicator()
        : SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 88, 109, 243),
                  Color.fromARGB(230, 23, 51, 138),
                ])),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        child: Image.asset("assets/Icons/01.png",
                            fit: BoxFit.cover)),
                    Text(
                      "Nasıl yardımcı olabilirim?",
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomLeft,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text(
                  result.menu.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              for (int i = 0; i < result.menu.submenu.length; i++)
                keyDown == i
                    ? Column(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: ListTile(
                            title: Text(result.menu.submenu[i].title),
                            onTap: () {
                              setState(() {
                                if (keyDown == i)
                                  keyDown = -1;
                                else
                                  keyDown = i;
                              });
                            },
                            trailing: keyDown != i
                                ? Icon(Icons.keyboard_arrow_down)
                                : Icon(Icons.keyboard_arrow_up),
                          ),
                        ),
                        subMenu(i)
                      ])
                    : Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: ListTile(
                          title: Text(result.menu.submenu[i].title),
                          onTap: () {
                            setState(() {
                              if (keyDown == i)
                                keyDown = -1;
                              else
                                keyDown = i;
                            });
                          },
                          trailing: keyDown != i
                              ? Icon(Icons.keyboard_arrow_down)
                              : Icon(Icons.keyboard_arrow_up),
                        ))
            ],
          ));
  }
}
