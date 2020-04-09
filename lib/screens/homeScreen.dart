import 'package:farmaciaplantao/model/farmacia.dart';
import 'package:farmaciaplantao/model/plantao.dart';
import 'package:farmaciaplantao/service/Service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  Service service = new Service();
  DateTime dataDeHoje = DateTime.now();
  Farmacia farmaciaDePlantao;
  Plantao plantao;
  List<Plantao> listaPlantaoAux;
  @override
  Widget build(BuildContext context) {
    bool isToday(DateTime data){
      final diff = dataDeHoje.difference(data).inDays;
      if(diff==0){
        return true;
      } else {
        return false;
      }
    }

    List<Plantao> listaPlantao = service.criaListaPlantao();
    listaPlantaoAux = listaPlantao.where((element) => (element.fim.isAfter(dataDeHoje) && element.inicio.isBefore(dataDeHoje)) || isToday(element.inicio) || isToday(element.fim)).toList();
    if(listaPlantaoAux.length > 1){
      farmaciaDePlantao = listaPlantaoAux[1].farmacia;
      plantao = listaPlantaoAux[1];
    } else {
      farmaciaDePlantao = listaPlantaoAux[0].farmacia;
      plantao = listaPlantaoAux[0];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Fármacia de Plantão - SMI'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      drawer: Drawer(
        
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
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
                          farmaciaDePlantao.nome, style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          'Plantão do dia ' + plantao.inicio.day.toString()+'/'+plantao.inicio.month.toString()+'/'+plantao.inicio.year.toString()  + ' até ' + plantao.inicio.day.toString()+'/'+plantao.fim.month.toString()+'/'+plantao.fim.year.toString(),
                          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Text('Telefone: ' + farmaciaDePlantao.telefone, style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(farmaciaDePlantao.endereco, style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.bold))
                      ),
                    ),
                    Align(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(farmaciaDePlantao.image, height: MediaQuery.of(context).size.height * 0.5,)
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            String tel = farmaciaDePlantao.telefone.substring(3);
                            UrlLauncher.launch('tel:${tel}');
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5,),
                              Text("Ligar para farmacia", style: GoogleFonts.lato(fontWeight: FontWeight.bold, color: Colors.blue),)
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            UrlLauncher.launch('https://www.google.com/maps/search/?api=1&query=${farmaciaDePlantao.latitude},${farmaciaDePlantao.longitude}');
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.map,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5,),
                              Text("Localização", style: GoogleFonts.lato(fontWeight: FontWeight.bold, color: Colors.blue),)
                            ],
                          ),
                        ),

                      ],
                    )

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

