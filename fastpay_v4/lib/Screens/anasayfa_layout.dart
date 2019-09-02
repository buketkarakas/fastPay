import '../Screens/Bildirimler_screen.dart';
import '../presentation/my_flutter_app_icons.dart';

import '../Screens/anasayfa_screen.dart';
import 'package:flutter/material.dart';
import './Profilim_screen.dart';
import "./login_screen.dart";
import '../Screens/tab_fırsatlar.dart';
import '../Screens/katildigi_kampanyalar_screen.dart';
import '../Screens/islemler.dart';

class AnasayfaLayout extends StatefulWidget {
  @override
  _AnasayfaLayoutState createState() => _AnasayfaLayoutState();
}

class _AnasayfaLayoutState extends State<AnasayfaLayout>
    with SingleTickerProviderStateMixin {
  final List<Widget> _children = [
    AnasayfaScreen(),
    AnasayfaScreen(),
    Islemler(),
     Bildirimler(),
    Hesabim()
  ];
  final List<String> _title = [
    "fastPay",
    "Fırsatlar",
    "İşlemler",
    "Bildirimler",
    "Profilim"
  ];
 
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_title[_currentIndex]),
          backgroundColor: Colors.indigo[800],
          bottom: _currentIndex == 1
              ? TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    Tab(
                      text: "Fırsatlar",
                    ),
                    Tab(text: "Katıldığın Kampanyalar"),
                  ],
                  controller: _tabController,
                )
              : null,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.home) ,
              title: Text("ANA SAYFA", style: TextStyle(fontSize: 10)),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.star_filled,
              ),
              title: Text("FIRSATLAR", style: TextStyle(fontSize: 10)),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.exchange,
              ),
              title: Text("İŞLEMLER", style: TextStyle(fontSize: 10)),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                title: Text("BİLDİRİMLER", style: TextStyle(fontSize: 10))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                title: Text("PROFİLİM", style: TextStyle(fontSize: 10)))
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: onTabTapped,
        ),
        body: _currentIndex == 1
            ? TabBarView(
                children: [TabFirsatlar(), KatildigiKampanyalar()],
                controller: _tabController,
              )
            : _children[_currentIndex]);
  }
}
