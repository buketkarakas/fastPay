import 'dart:convert';

import 'package:fastpay_v4/Widgets/f%C4%B1rsat_kart%C4%B1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models.dart/fırsat_data.dart';

class SecilenFirsatlar extends StatefulWidget {
  @override
  _SecilenFirsatlarState createState() => _SecilenFirsatlarState();
}

class _SecilenFirsatlarState extends State<SecilenFirsatlar> {
  bool isLoading = false;
  CampaignData res;
  Future<CampaignData> kampanyaAl() async {
    return http.get('https://fastpaydev.denizbank.com/api/campaign', headers: {
      'Content-Type': 'application/json'
    }).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while taking campaign data");
      }
      Map<String, dynamic> key = jsonDecode(response.body);
      res = CampaignData.fromJson(key["campaignList"]);
      //print(response.body);

      setState(() {
        isLoading = true;
      });

      return res;
    });
  }



  @override
  Widget build(BuildContext context) {
    kampanyaAl();
    return !isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text("Senin için Seçtiklerim",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                for (int i = 0; i < res.campaignList.length; i++)
                  Firsat(
                      baslik: res.campaignList[i].title,
                      yazi: res.campaignList[i].text,
                      resim: res.campaignList[i].url,
                      altbaslik: res.campaignList[i].subtitle),
                
                RaisedButton(
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black54)),
                  child: Text("Tüm fırsatlar",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ]);
  }
}
