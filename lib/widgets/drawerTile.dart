import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  DrawerTile(this.icon, this.text, this.pageController, this.page);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          print(page);
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                  icon,
                  size: 32.0,
                  color: Colors.white
              ),
              SizedBox(width: 32),
              Text(
                text,
                style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
