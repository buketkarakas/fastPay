import 'package:flutter/material.dart';

class KatildigiKampanyalar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            "Henüz katıldığın bir kampanya yok. Katıldığın kampanyaları buradan takip edebilirsin.",
            textAlign: TextAlign.center, style: Theme.of(context).textTheme.subhead,
          ),
        ),
      ],
    );
  }
}
