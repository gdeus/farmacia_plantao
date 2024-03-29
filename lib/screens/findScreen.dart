import 'package:farmaciaplantao/model/farmacia.dart';
import 'package:farmaciaplantao/model/plantao.dart';
import 'package:farmaciaplantao/service/Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:intl/intl.dart';

class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  DateTime data = DateTime.now();
  Service service = new Service();
  Farmacia farmaciaDePlantao;
  Plantao plantao;
  List<Plantao> listaPlantaoAux;
  @override
  Widget build(BuildContext context) {
    var formatada = DateFormat('yyyy-MM-dd');
    String dataFormatada = formatada.format(data);
    DateTime dataMesmoAgora = DateTime.parse(dataFormatada);
    double altura = MediaQuery.of(context).size.height * 0.5;

    bool isToday(DateTime date) {
      final diff = dataMesmoAgora
          .difference(date)
          .inDays;
      if (diff == 0) {
        return true;
      } else {
        return false;
      }
    }
    List<Plantao> listaPlantao = service.criaListaPlantao();
    print(data);
    listaPlantaoAux = listaPlantao.where((element) => (element.fim.isAfter(data) && element.inicio.isBefore(data)) || isToday(element.inicio) || isToday(element.fim)).toList();
    if (listaPlantaoAux.length > 1) {
      farmaciaDePlantao = listaPlantaoAux[1].farmacia;
      plantao = listaPlantaoAux[1];
      print(listaPlantaoAux.length);
    } else {
      farmaciaDePlantao = listaPlantaoAux[0].farmacia;
      plantao = listaPlantaoAux[0];
    }

    return  Column(
      children: <Widget>[
        RaisedButton(
          onPressed: (){
            DatePicker.showDatePicker(context, showTitleActions: true, minTime: DateTime(2021, 2, 20), maxTime: DateTime(2022, 1, 8), locale: LocaleType.pt,
                onChanged: (date){
                  data = date;
                },
                onConfirm: (date){
                  setState(() {
                    data = date;
                    print(data);
                  });
                }
            );
          },
          color: Colors.redAccent,
          child: Text("Clique aqui parra selecionar uma data para buscar", style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
        Text("Data selecionada: " + data.day.toString() + '/' + data.month.toString() + '/' + data.year.toString(), style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 16),),
        Expanded(
          child: ListView.builder(
            itemCount: listaPlantaoAux.length,
            itemBuilder: (BuildContext ctcx, int index) {
              if (listaPlantaoAux.length == 1) {
                return FarmaciaDePlantao(listaPlantaoAux[index],
                    listaPlantaoAux[index].farmacia, altura);
              } else {
                if (index == 0) {
                  return Column(
                    children: <Widget>[
                      Text("Atenção hoje dia " + plantao.inicio.day.toString() +
                          '/' +
                          plantao.inicio.month.toString() +
                          '/' +
                          plantao.inicio.year.toString() + " é dia de troca de plantão: ", style:  GoogleFonts.lato(fontSize: 14.0, fontWeight: FontWeight.bold),),
                      Text("Das 0h ás 12h: ", style:  GoogleFonts.lato(fontSize: 14.0, fontWeight: FontWeight.bold),),
                      FarmaciaDePlantao(listaPlantaoAux[index],
                          listaPlantaoAux[index].farmacia, altura)
                    ],
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Text("Das 12h em diante: ", style:  GoogleFonts.lato(fontSize: 14.0, fontWeight: FontWeight.bold),),
                      FarmaciaDePlantao(listaPlantaoAux[index],
                          listaPlantaoAux[index].farmacia, altura)
                    ],
                  );
                }
              }
            },
          ),
        )

      ],
    );
  }

  Widget FarmaciaDePlantao(
      Plantao plantao, Farmacia farmaciaDePlantao, altura) {
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
                child: Text(farmaciaDePlantao.nome,
                    style: GoogleFonts.lato(
                        fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    'Plantão do dia ' +
                        plantao.inicio.day.toString() +
                        '/' +
                        plantao.inicio.month.toString() +
                        '/' +
                        plantao.inicio.year.toString() +
                        ' até ' +
                        plantao.fim.day.toString() +
                        '/' +
                        plantao.fim.month.toString() +
                        '/' +
                        plantao.fim.year.toString(),
                    style: GoogleFonts.lato(
                        fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text('Telefone: ' + farmaciaDePlantao.telefone,
                        style: GoogleFonts.lato(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(farmaciaDePlantao.endereco,
                        style: GoogleFonts.lato(
                            fontSize: 20.0, fontWeight: FontWeight.bold))),
              ),
              Align(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      farmaciaDePlantao.image,
                      height: altura,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //change here don't //worked
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: FlatButton(
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
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Ligar",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      onPressed: () {
                        String tel = farmaciaDePlantao.telefone.substring(3);
                        UrlLauncher.launch(
                            'https://www.google.com/maps/search/?api=1&query=${farmaciaDePlantao.latitude},${farmaciaDePlantao.longitude}');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.map,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Localização",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
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

