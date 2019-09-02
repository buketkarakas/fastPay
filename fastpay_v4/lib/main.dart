import './Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import './Screens/anasayfa_screen.dart';
import './Screens/anasayfa_layout.dart';
import './providers/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          notifier: Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'FastPay',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(36, 63, 149, 1),
          accentColor: Color.fromRGBO(51, 51, 51, 1),
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "GalanoGrotesque",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
            subtitle: TextStyle(
              fontFamily: "GalanoGrotesque",
              fontSize: 14,
            ),
          ),
        ),
        home:// AuthScreen()
        AnasayfaLayout(),
      ),
    );
  }
}
