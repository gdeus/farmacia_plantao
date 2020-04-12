import 'package:farmaciaplantao/screens/homeScreen.dart';
import 'package:farmaciaplantao/screens/pageView.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Farmácia de Plantão São Miguel do Igualçu',
        debugShowCheckedModeBanner: false,
        home: PageNavigator()
    );
  }
}