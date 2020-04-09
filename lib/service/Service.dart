import 'package:farmaciaplantao/model/farmacia.dart';
import 'package:farmaciaplantao/model/plantao.dart';

class Service {
  int aux = 0;
  List<Plantao> listaPlantao = [];
  List<Farmacia> criaListaFarmacia() {
    //Farmacia(this.nome, this.endereco, this.latitude, this.longitude, this.image, this.telefone);
    List<Farmacia> listaFarmacia = [
      Farmacia(0, 'Farmácia Farma Vitta', 'R. Duque de Caxias, 910 - Centro', '-25.345655', ', -54.241415', 'images/precobaixo.png', '(45) 3565-2753'),
      Farmacia(1, 'Farmácia N. Sª Aparecida', 'R. Castro Alves, 308 - Centro', '-25.346588', '-25.346588, -54.242234', 'images/nossaSenhora.png', '(45) 3565-1431'),
      Farmacia(2, 'Farmácia Farma Útil', 'Rua Farroupilha', '-25.345917', '-54.240171', 'images/farmautil.png', '(45) 3565-1446'),
      Farmacia(3, 'Farmácia Farma Amboni', 'Rua Farroupilha', '-25.344041', '-54.239445', 'images/amboni.png', '(45) 3565-1747'),
      Farmacia(4, 'Farmácia Saúde', 'Rua Farroupilha 20', '-25.343956', '-54.239479', 'images/saude.png', '(45) 3565-7020'),
      Farmacia(5, 'Farmácia São Miguel', 'Rua Farroupilha, 77 - Centro', '123', '123', 'images/saomiguel.png', '(45) 3565-1395'),
      Farmacia(6, 'Farmácia Coopefarma', 'R. Castro Alves, 195 - Centro', '-25.347193', '-54.241365', 'images/coperfarma.png', '(45) 3565-1393'),
      Farmacia(7, 'Farmácia do Roque', 'R. Farroupilha, 370 - Centro', '-25.346817', '-54.240633', 'images/roque.png', '(45) 3565-2137'),
      Farmacia(8, 'Farmácia Genérica', 'Av. Iguaçu, 485 - Centro', '-25.352636', '-54.241805', 'images/generica.png', '(45) 3565-1444'),
      Farmacia(9, 'Farmácia Bioética', 'Rua Farroupilha - Centro', '-25.346605', '-54.240474', '123', '(45) 3565-1477'),
      Farmacia(10, 'Farmácia Farma Brito', 'R. Farroupilha, 139 - Centro', '-25.344986', '-54.239809', 'images/brito.png', '(45) 3565-2771'),
      Farmacia(11, 'Farmácia Farma e Vida', 'R. Duque de Caxias, 910', '-25.345688', '-54.241427', 'images/farmaevida.png', '(45) 3565-2753'),
      Farmacia(12, 'Farmácia Preço Baixo', 'Rua Farroupilha 77, Centro', '123', '123', 'images/precobaixo.png', '(45) 3565-1395'),
      Farmacia(13, 'Farmácia Ita Farma', 'Rua Alfredo Chaves, 99, Centro', '-25.344709', '-54.239428', 'images/itafarma.png', '(45) 3565-6029'),
    ];

    return listaFarmacia;
  }
  //Plantao(this.inicio, this.fim, this.farmacia);
  List<Plantao> criaListaPlantao(){
    List<Farmacia> listaFarmacia = criaListaFarmacia();
    Plantao plantao = new Plantao(DateTime.parse('2020-01-18'), DateTime.parse('2020-01-25'), listaFarmacia[0]);
    listaPlantao.add(plantao);
    for(int i=1;i<=56;i++){
      aux = aux + 1;
      if(aux>=14){
        aux = 0;
        print('entrei aqui');
      }
      plantao = Plantao(plantao.fim, plantao.fim.add(Duration(days: 7)), listaFarmacia[aux]);
      listaPlantao.add(plantao);
    }

    return listaPlantao;
  }

}