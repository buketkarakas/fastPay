import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models.dart/fırsat_data.dart';
import '../Widgets/fırsat_kartı.dart';

class TabFirsatlar extends StatefulWidget {
  @override
  _TabFirsatlarState createState() => _TabFirsatlarState();
}

class _TabFirsatlarState extends State<TabFirsatlar> {
  FocusNode _focus = new FocusNode();
  CampaignData res;
  bool _isSearching;
  List<ListData> searchresult = new List();
  List<Firsat> firsatlar = new List();
  bool _loading = true;
  final TextEditingController _controller = new TextEditingController();
  String _searchText = "";

  Future<CampaignData> kampanyaAl() async {
    return http.get('*******************', headers: {
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
        _loading = false;
      });

      return res;
    });
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      _isSearching = false;
      _controller.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    _focus.addListener(_onFocusChange);
    _searchText=_controller.text;
    getCamp();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      _handleSearchStart();
    } else {
      _handleSearchEnd();
    }
  }

  void getCamp() async {
    await kampanyaAl();
  }

  void searchOperation() {
    searchresult.clear();
    for (int i = 0; i < res.campaignList.length; i++) {
      String data = res.campaignList[i].text;
      if (data.toLowerCase().contains(_searchText.toLowerCase())) {
        searchresult.add(res.campaignList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey),
                        right: BorderSide(color: Colors.grey),
                        left: BorderSide(color: Colors.grey),
                        bottom: BorderSide(color: Colors.grey))),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      labelText: "Fırsatlarda Ara"),
                  focusNode: _focus,
                  controller: _controller,
                  onSubmitted: (val) {
                    searchOperation();
                  },
                ),
              ),
              !_isSearching
                  ? Column(children: <Widget>[
                      for (int i = 0; i < res.campaignList.length; i++)
                        Firsat(
                            baslik: res.campaignList[i].title,
                            yazi: res.campaignList[i].text.substring(0, 34),
                            resim: res.campaignList[i].url,
                            altbaslik: res.campaignList[i].subtitle),
                    ])
                  : Column(
                      children: <Widget>[
                        for (int i = 0; i < searchresult.length; i++)
                          Firsat(
                            baslik: searchresult[i].title,
                            altbaslik: searchresult[i].subtitle,
                            yazi: searchresult[i].text,
                            resim: searchresult[i].url,
                          ),
                      ],
                    )
            ],
          ));
  }
}
