import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawerTile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  Widget _buildDrawerback() => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.redAccent,
          Colors.white
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
      )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerback(),
            ListView(
              padding: EdgeInsets.only(top: 16.0),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text('Farmácias de Plantão \nSão Miguel do Iguaçu', style: GoogleFonts.lato(fontSize: 24, color: Colors.white),),
                    ],
                  )
                ),
                Divider(color: Colors.white,),
                DrawerTile(Icons.home, "Farmácia de Plantão no dia", pageController, 0),
                DrawerTile(Icons.list, "Listar todas as farmácias", pageController, 1),
                DrawerTile(Icons.search, "Buscar por dia", pageController, 2),
                DrawerTile(Icons.info, "Sobre o aplicativo", pageController, 3),
              ],
            )
        ],
      ),
    );
  }
}
