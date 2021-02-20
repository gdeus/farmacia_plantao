import 'package:farmaciaplantao/model/farmacia.dart';
import 'package:farmaciaplantao/model/plantao.dart';

class Service {
  int aux = 0;
  List<Plantao> listaPlantao = [];
  List<Farmacia> listaFarmacia = [];
  List<Farmacia> criaListaFarmacia() {
    //Farmacia(this.nome, this.endereco, this.latitude, this.longitude, this.image, this.telefone);
    List<Farmacia> listaFarmacia = [
      Farmacia(0, 'Farmácia Brava', 'Rua Farroupilha, 271, Centro', '-25.344945', '-54.239454', 'images/brava.png', '(45) 3565-2963'),
      Farmacia(1, 'Farmácia N. Sª Aparecida', 'R. Castro Alves, 308 - Centro', '-25.346668', '-54.242351', 'images/nossaSenhora.png', '(45) 3565-1431'),
      Farmacia(2, 'Farmácia Farma Útil', 'Rua Farroupilha', '-25.345917', '-54.240171', 'images/farmaUtil.png', '(45) 3565-1446'),
      Farmacia(3, 'Farmácia Farma Amboni', 'Rua Farroupilha', '-25.344041', '-54.239445', 'images/amboni.png', '(45) 3565-1747'),
      Farmacia(4, 'Farmácia Saúde', 'Rua Farroupilha 20', '-25.343956', '-54.239479', 'images/saude.png', '(45) 3565-7020'),
      Farmacia(5, 'Farmácia São Miguel', 'Rua Farroupilha - Centro', '-25.344216', '-54.239515', 'images/saoMiguel.png', '(45) 3565-1395'),
      Farmacia(6, 'Farmácia Coopefarma', 'R. Castro Alves, 195 - Centro', '-25.347193', '-54.241365', 'images/coperfarma.png', '(45) 3565-1393'),
      Farmacia(7, 'Farmácia do Roque', 'R. Farroupilha, 370 - Centro', '-25.346817', '-54.240633', 'images/roque.png', '(45) 3565-2137'),
      Farmacia(8, 'Farmácia Genérica', 'Av. Iguaçu, 485 - Centro', '-25.352636', '-54.241805', 'images/genercia.png', '(45) 3565-1444'),
      Farmacia(9, 'Farmácia Bioética', 'Rua Farroupilha - Centro', '-25.346605', '-54.240474', 'images/bioetica.png', '(45) 3565-1477'),
      Farmacia(10, 'Farmácia Farma Brito', 'R. Farroupilha, 139 - Centro', '-25.344981', '-54.239809', 'images/farmaBrito.png', '(45) 3565-2771'),
      Farmacia(11, 'Farmácia Farma e Vida', 'R. Duque de Caxias, 910', '-25.345689', '-54.241427', 'images/farmaVida.png', '(45) 3565-2753'),
      Farmacia(12, 'Farmácia Preço Baixo', 'Rua Farroupilha 77, Centro', '-25.344482', '-54.239502', 'images/preco.png', '(45) 3565-1760'),
      Farmacia(13, 'Farmácia ItaFarma', 'Rua Alfredo Chaves, 99, Centro', '-25.344945', '-54.239454', 'images/itafarma.png', '(45) 3565-6029'),
      Farmacia(14, 'Farmácia FarmaVitta', 'Rua Alfredo Chaves, 489 - Centro', '-25.346621', '-54.2418886', 'images/farmaVitta.png', '(45) 3565-7587'),
    ];

    return listaFarmacia;
  }
  //Plantao(this.inicio, this.fim, this.farmacia);
  List<Plantao> criaListaPlantao(){
    List<Farmacia> listaFarmacia = criaListaFarmacia();
    Plantao plantao = new Plantao(DateTime.parse('2021-02-20'), DateTime.parse('2021-02-27'), listaFarmacia[0]);
    if(listaPlantao.length < 46){
      listaPlantao.add(plantao);
      for(int i=1;i<=45;i++){
        aux = aux + 1;
        if(aux>=15){
          aux = 0;
          print('entrei aqui');
        }
        plantao = Plantao(plantao.fim, plantao.fim.add(Duration(days: 7)), listaFarmacia[aux]);
        listaPlantao.add(plantao);
      }
    } else {
      print('Lista cheia');
    }

    return listaPlantao;
  }

}