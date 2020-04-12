import 'package:farmaciaplantao/model/farmacia.dart';
import 'package:farmaciaplantao/service/Service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ListAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height * 0.30;
    double largura = MediaQuery.of(context).size.width * 0.90;
    Service service = new Service();
    List<Farmacia> listaFarmacia = [];
    print(listaFarmacia.length);
    if(listaFarmacia.length == 0){
      listaFarmacia = service.criaListaFarmacia();
    } else {
      print("lista já preenchida sem necessidade de executar novamente");
    }
    print(listaFarmacia.length);
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: listaFarmacia.length,
            itemBuilder: (BuildContext ctcx, int index){
              return CardFarmacia(listaFarmacia[index], altura, largura);
            },
          ),
        )
      ],
    );
  }


  Widget CardFarmacia(Farmacia farmacia, double altura, double largura){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    farmacia.nome, style: GoogleFonts.lato(
                    fontSize: 20.0, fontWeight: FontWeight.bold)
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text('Telefone: ' + farmacia.telefone,
                        style: GoogleFonts.lato(fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Align(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(farmacia.endereco,
                        style: GoogleFonts.lato(fontSize: 20.0,
                            fontWeight: FontWeight.bold))
                ),
              ),
              Align(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      farmacia.image, height: altura, width: largura,)
                ),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      String tel = farmacia.telefone
                          .substring(3);
                      UrlLauncher.launch('tel:${tel}');
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5,),
                        Text("Ligar para farmacia",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),)
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      UrlLauncher.launch(
                          'https://www.google.com/maps/search/?api=1&query=${farmacia
                              .latitude},${farmacia
                              .longitude}');
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.map,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5,),
                        Text("Localização", style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),)
                      ],
                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
