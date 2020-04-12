import 'package:farmaciaplantao/screens/findScreen.dart';
import 'package:farmaciaplantao/screens/homeScreen.dart';
import 'package:farmaciaplantao/screens/listAll.dart';
import 'package:farmaciaplantao/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

import 'info.dart';

class PageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Fármacia de Plantão - SMI'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      drawer: CustomDrawer(pageController),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          HomeScreen(),
          ListAll(),
          FindScreen(),
          Info()
        ],
      ),
    );
  }
}
