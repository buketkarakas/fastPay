import 'package:flutter/material.dart';
import '../Widgets/para_gonder_buton.dart';

class SifreIslemleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SifreIslemleriPage(),
    );
  }
}

class SifreIslemleriPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SifreIslemleriState();
  }
}

class _SifreIslemleriState extends State<SifreIslemleriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: new Text(
          'Sifre İşlemleri',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: widgetForBodyDegerlendirme(),
    );
  }

  Widget widgetForBodyDegerlendirme() {
    return Container(
        child: Column(
      children: <Widget>[
        ParaGonderButon(context, null, null, "Şifreni Güncelle"),
        ParaGonderButon(context, null, null, "Çizgir Şifreni Tamamla")
      ],
    ));
  }
}
