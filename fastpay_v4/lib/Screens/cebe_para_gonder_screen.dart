import 'package:flutter/material.dart';

import "../models.dart/transactions.dart";

class CebeParaGonder extends StatefulWidget {
  @override
  CebeParaGonderState createState() => CebeParaGonderState();
}

class CebeParaGonderState extends State<CebeParaGonder> {
  final _formKey = GlobalKey<FormState>();
  final _Transaction = Transaction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cebe Para Gönder'),
          backgroundColor: Colors.indigo[800],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  "FastPay ile 7/24 istediğin kişiye cepten cebe ücretsiz para gönderebilirsin.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Card(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    child: Text("Gönderen Hesap",
                        style: TextStyle(fontSize: 18, letterSpacing: -0.18)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("FastPay Hesabı/Vadesiz Hesap",
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Kullanılabilir Bakiye",
                        style: TextStyle(fontSize: 11, color: Colors.black45)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("6300 TL",
                        style: TextStyle(
                            fontSize: 29,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Builder(
                      builder: (context) => Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Cep No'),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value.isEmpty || value.length != 13) {
                                      return 'Lütfen geçerli bir telefon numarası girin!';
                                    }
                                  },
                                  onSaved: (val) =>
                                      setState(() => _Transaction.cepno = val),
                                ),
                                TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Tutar'),
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Lütfen geçerli bir tutar giriniz.';
                                      }
                                    },
                                    onSaved: (val) => setState(
                                        () => _Transaction.tutar = val)),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'Aciklama'),
                                  keyboardType: TextInputType.text,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  child: Container(
                                      width: 30,
                                      child: RaisedButton(
                                          color: Colors.red[600],
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          onPressed: () {
                                            final form = _formKey.currentState;
                                            if (form.validate()) {
                                              form.save();
                                              _Transaction.save();
                                              showAlertDialog(context);
                                            }
                                          },
                                          child: Text(
                                            'Devam Et',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                )
                              ])))),
            ],
          ),
        ));
  }

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {  Navigator.of(context).pop();},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(

    title: Text("FastPay"),
    content: Text("İşlemi Gerçekleştirdim."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
}
